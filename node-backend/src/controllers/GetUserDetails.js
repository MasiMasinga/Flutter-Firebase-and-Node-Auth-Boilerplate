
const GetUserDetails = async (res) => {
  try {

    let data = {
        id: res.params.id
    };

    const user = await prisma.user.findUnique({
      where: {
        id: data.id,
      },
    });

    return res.status(200).json({ user: user });
  } catch (error) {
    return res.status(401).send({ error });
  }
};

module.exports = {
    GetUserDetails,
};
