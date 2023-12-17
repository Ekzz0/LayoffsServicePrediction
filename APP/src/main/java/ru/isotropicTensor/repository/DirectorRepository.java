package ru.isotropicTensor.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.isotropicTensor.model.Director;

public interface DirectorRepository extends JpaRepository<Director, Integer> {
}
