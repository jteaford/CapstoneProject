package org.aim.carpentry.project;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface ProjectRepository extends CrudRepository<Project, Integer>{
    @Transactional
    @Modifying(clearAutomatically = true)
    @Query("UPDATE Project p SET p.status.id = :statusId WHERE p.id = :id")
    int updateStatus(@Param("id") int id, @Param("statusId") Integer statusId);

    @Query(value="select p.* from projects p where p.project_code like %?1% OR p.project_desc like %?1%",
     nativeQuery = true)
     Iterable<Project> search(@Param("keyword") String keyword);
}