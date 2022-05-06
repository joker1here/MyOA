package oa.mapper;

import oa.pojo.Relation;

import java.util.List;

public interface RelationMapper {
    List<Relation> findAllRelation();

    Relation findRelationById(int id);

    void saveRelation(Relation Relation);

    void updateRelation(Relation Relation);

    void deleteRelationById(int id);
}
