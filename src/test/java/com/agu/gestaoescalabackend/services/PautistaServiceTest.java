package com.agu.gestaoescalabackend.services;

import com.agu.gestaoescalabackend.entities.Pautista;
import com.agu.gestaoescalabackend.enums.GrupoPautista;
import com.agu.gestaoescalabackend.enums.StatusPautista;
import com.agu.gestaoescalabackend.repositories.PautistaRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.ActiveProfiles;

import java.time.LocalDate;
import java.util.List;

@SpringBootTest
@ActiveProfiles({"test"})
class PautistaServiceTest {
    @Autowired
    private PautistaService pautistaService;

    @MockBean
    private PautistaRepository pautistaRepository;

    @Test
    void shouldReturnPautistasWithGivenStatus() {
        //Arrange
        /*var pautistaAtivo = Pautista.builder()
                .id(1L)
                .nome("nome")
                .grupoPautista(GrupoPautista.TODOS)
                .statusPautista(StatusPautista.ATIVO)
                .dataInicial(LocalDate.now())
                .dataFinal(LocalDate.now().plusDays(5))
                .peso(1)
                .build();

        when(pautistaRepository.findAllByStatusPautistaInOrderByNomeAsc(List.of(StatusPautista.ATIVO))).thenReturn(List.of(pautistaAtivo));
        //Act

        var resultado = pautistaService.findByStatus(List.of(StatusPautista.ATIVO));
        //Assertions

        assertThat(resultado).isNotNull();
        assertThat(resultado.size()).isEqualTo(1);
        assertThat(resultado.get(0).getStatusPautista()).isEqualTo(StatusPautista.ATIVO);*/
    }

    List<Pautista> mockPautista(){
        var pautistaAtivo = Pautista.builder()
                .id(1L)
                .nome("nome")
                .grupoPautista(GrupoPautista.TODOS)
                .statusPautista(StatusPautista.ATIVO)
                .dataInicial(LocalDate.now())
                .dataFinal(LocalDate.now().plusDays(5))
                .peso(1)
                .build();

        var pautistaInativo = Pautista.builder()
                .id(1L)
                .nome("nome")
                .grupoPautista(GrupoPautista.TODOS)
                .statusPautista(StatusPautista.INATIVO)
                .dataInicial(LocalDate.now())
                .dataFinal(LocalDate.now().plusDays(5))
                .peso(1)
                .build();

        return List.of(pautistaAtivo, pautistaInativo);
    }
}