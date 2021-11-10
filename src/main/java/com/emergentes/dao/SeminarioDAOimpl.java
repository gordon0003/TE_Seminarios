
package com.emergentes.dao;

import com.emergentes.modelo.Seminario;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SeminarioDAOimpl extends ConexionDB implements SeminarioDAO{

    @Override
    public void insert(Seminario seminario) throws Exception {
       try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("INSERT into seminarios (titulo, expositor, fecha, hora, cupo) values (?, ?, ?, ?, ?)");
            ps.setString(1, seminario.getTitulo());
            ps.setString(2, seminario.getExpositor());
            ps.setString(3, seminario.getFecha());
            ps.setString(4, seminario.getHora());
            ps.setInt(5, seminario.getCupo());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }  
    }

    @Override
    public void update(Seminario seminario) throws Exception {
        try{
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("UPDATE seminarios set titulo = ?, expositor = ?, fecha = ?, hora = ?, cupo = ? where id = ?");
            ps.setString(1, seminario.getTitulo());
            ps.setString(2, seminario.getExpositor());            
            ps.setString(3, seminario.getFecha());  
            ps.setString(4, seminario.getHora()); 
            ps.setInt(5, seminario.getCupo()); 
            ps.setInt(6, seminario.getId());
            ps.executeUpdate();
        }catch(Exception e){
            throw e;
        }finally{
            this.desconectar();
        }  
    }

    @Override
    public void delete(int id) throws Exception {
       try{
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("DELETE FROM seminarios WHERE id = ?");
            ps.setInt(1,id);
            ps.executeUpdate();
        }catch(Exception e){
            throw e;
        }finally{
            this.desconectar();
        }   
    }

    @Override
    public Seminario getById(int id) throws Exception {
        Seminario cli = new Seminario();
        try {

            this.conectar();

            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM seminarios WHERE id = ? limit 1");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                cli.setId(rs.getInt("id"));
                cli.setTitulo(rs.getString("titulo"));
                cli.setExpositor(rs.getString("expositor"));
                cli.setFecha(rs.getString("fecha"));
                cli.setHora(rs.getString("hora"));
                cli.setCupo(rs.getInt("cupo"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return cli;   
    }

    @Override
    public List<Seminario> getAll() throws Exception {
        List<Seminario> lista = null;
        try{
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM seminarios");
            ResultSet rs = ps.executeQuery();
            
            lista = new ArrayList<Seminario>();
            while(rs.next()){
                Seminario cli = new Seminario();
                System.out.println("Fila ...");
                cli.setId(rs.getInt("id"));
                cli.setTitulo(rs.getString("titulo"));
                cli.setExpositor(rs.getString("expositor"));
                cli.setFecha(rs.getString("fecha"));
                cli.setHora(rs.getString("hora"));
                cli.setCupo(rs.getInt("cupo"));
                lista.add(cli);
            }
            rs.close();
            ps.close();
        }catch(Exception e){
            throw e;
        }finally{
            this.desconectar();
        }  
        return lista;        
    }
    
}
