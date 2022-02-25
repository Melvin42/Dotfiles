#ifndef SKELETON_HPP
#define SKELETON_HPP

#define GREEN_IT "\033[32;3m"
#define END_COLOR "\033[0m"

class Skeleton {
	public:

		Skeleton();
		Skeleton(const Skeleton &skeleton);
		~Skeleton();

		Skeleton &operator=(const Skeleton &skeleton);

	private:
};

#endif
