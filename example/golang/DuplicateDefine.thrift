namespace go duplicate

typedef i32 DupName

const i32 DupName = 1

enum DupName {
    Dup0,
}

struct DupName {
    1: required string name
}

service DupName {
    void GetName()
}
