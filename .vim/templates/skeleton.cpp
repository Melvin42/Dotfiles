#include "Skeleton.hpp"

Skeleton::Skeleton() {
	std::cout << GREEN_IT << "Default constructor called" << END_COLOR << std::endl;
	return ;
}

Skeleton::Skeleton(const Skeleton &skeleton) {
	std::cout << GREEN_IT << "Copy constructor called" << END_COLOR << std::endl;
	*this = skeleton;
	return ;
}

Skeleton::~Skeleton() {
	std::cout << GREEN_IT << "Destructor called" << END_COLOR << std::endl;
	return ;
}

Skeleton &Skeleton::operator=(const Skeleton &skeleton) {
	std::cout << "Copy assignement operator called" << std::endl;
	return *this;
}
