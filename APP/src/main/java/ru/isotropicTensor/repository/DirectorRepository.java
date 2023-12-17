package ru.isotropicTensor.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.isotropicTensor.model.Director;

import java.util.List;
import java.util.Set;

public interface DirectorRepository extends JpaRepository<Director, Integer> {
    List<Director> findByDepartmentIn(Set<String> departments);
}
