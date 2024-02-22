
// JMR, 2021

// Complete the functions (marked by ...)
// so that it passes all tests in PersonTest.

#include "Person.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This variable stores the last ID that was assigned to a Person.
// It should be used to assign serial, unique IDs automatically upon creation.
// The first person will have id=1, the second id=2, etc.
static int lastID = 0;

// Alocate and store a Person.
// Returns the pointer to the new structure,
// or NULL if allocation fails.
// The names are copied to internally allocated memory.
Person *PersonCreate(const char *fname, const char *lname, int yy, int mm,
                     int dd) {
  // EDIT Person* p = ...

  size_t flen = strnlen(fname, 100);
  size_t llen = strnlen(lname, 100);

  Person* p = (Person*) malloc(sizeof(Person));

  if (p == NULL) return p;

  char *c = (char*) malloc(flen+llen+2*sizeof(char));

  if (c == NULL) {
    free(p);
    return NULL;
  };

  p->birthDate.year = yy;
  p->birthDate.month = mm;
  p->birthDate.day = dd;

  p->firstName = c;
  p->lastName = c+flen+1;
  strcpy(p->firstName, fname);
  strcpy(p->lastName, lname);

  p->id = ++lastID;

  return p;
}

// Free the memory pointed to by *pp and by the names inside it,
// and invalidate *pp contents.
// Precondition: *pp must not be NULL.
// Postcondition: *pp is set to NULL.
void PersonDestroy(Person **pp) {
  assert(*pp != NULL);


  free((*pp)->firstName);
  free(*pp);
  *pp = NULL;
  // EDIT ...
}

// Prints a person formatted as "[id, lastname, firstname, birthdate]",
// followed by a suffix string.
void PersonPrintf(Person *p, const char *suffix) {
  if (p == NULL)
    printf("NULL%s", suffix);
  else
    printf("(%d, %s, %s, %s)%s", p->id, p->lastName, p->firstName,
           DateFormat(&(p->birthDate), YMD), suffix);
}

// Compare birth dates of two persons.
// Return a negative/positive integer if p1 was born before/after p2.
// Return zero if p1 and p2 were born on the same date.
int PersonCompareByBirth(const Person *p1, const Person *p2) {
  // EDIT ...
  return DateCompare(&p1->birthDate, &p2->birthDate);

}

// Compare two persons by last name, then first name (if last name is the same).
// Return a -/+/0 integer if p1 precedes/succeeds/is equal to p2.
int PersonCompareByLastFirstName(const Person *p1, const Person *p2) {
  // EDIT ...
  int compare = strcmp(p1->lastName, p2->lastName);

  if (compare != 0) {
    return compare;
  }

  compare = strcmp(p1->firstName, p2->firstName);
  return compare;
}
