//
//  PokemonDB+Mapping.swift
//  Pokemon
//
//  Created by Gabor Pinter on 16/09/2024.
//

extension PokemonApiModel: DBType {
    func toDB() -> PokemonDB {
        .build { object in
            object.abilities.append(objectsIn: abilities.toDB())
            object.baseExperience = baseExperience
            object.cries = cries?.toDB()
            object.forms.append(objectsIn: forms.toDB())
            object.height = height
            object.id = id
            object.isDefault = isDefault
            object.locationAreaEncounters = locationAreaEncounters
            object.name = name
            object.order = order
            object.species = species?.toDB()
            object.weight = weight
        }
    }
}

extension SpeciesApi: DBType {
    func toDB() -> SpeciesDB {
        .build { object in
            object.name = name
            object.url = url
        }
    }
}

extension AbilityApi: DBType {
    func toDB() -> AbilityDB {
        .build { object in
            object.ability = ability?.toDB()
            object.isHidden = isHidden
            object.slot = slot
        }
    }
}

extension CriesApi: DBType {
    func toDB() -> CriesDB {
        .build { object in
            object.latest = latest
            object.legacy = legacy
        }
    }
}


extension PokemonDB: DomainType {
    func toDomain() -> Pokemon {
        .init(abilities: abilities.map { $0.toDomain() },
              baseExperience: baseExperience,
              cries: cries?.toDomain(),
              forms: forms.map { $0.toDomain() },
              height: height,
              id: id,
              isDefault: isDefault,
              locationAreaEncounters: locationAreaEncounters,
              name: name,
              order: order, 
              species: species?.toDomain(),
              weight: weight)
    }
}

extension SpeciesDB: DomainType {
    func toDomain() -> Species {
        .init(name: name, url: url)
    }
}

extension AbilityDB: DomainType {
    func toDomain() -> Ability {
        .init(ability: ability?.toDomain(),
              isHidden: isHidden,
              slot: slot)
    }
}

extension CriesDB: DomainType {
    func toDomain() -> Cries {
        .init(latest: latest,
              legacy: legacy)
    }
}
