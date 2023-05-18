package com.generation.ladylink.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import com.generation.ladylink.model.Tema;

public interface TemaRepository extends JpaRepository<Tema, Long>{
	
	public List <Tema> findAllByTituloContainingIgnoreCase(@Param("titulo") String titulo);

}
