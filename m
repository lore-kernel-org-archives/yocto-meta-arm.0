Subject: Re: Proposal to import ARM GCC toolchain recipes into meta-arm
To: meta-arm@lists.yoctoproject.org
From: "Denys Dmytriyenko" <denis@denix.org>
X-Originating-Location: Arlington, Virginia, US (207.244.106.50)
X-Originating-Platform: Linux Chrome 78
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 23 Jan 2020 16:50:59 -0800
References: <CAFA6WYMS8Arp=nGhnf_4feXBfx7n9a-q6Tc4AXbQSafc+d0+oQ@mail.gmail.com>
In-Reply-To: <CAFA6WYMS8Arp=nGhnf_4feXBfx7n9a-q6Tc4AXbQSafc+d0+oQ@mail.gmail.com>
Message-ID: <12230.1579827059785197376@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="OuhxGdI5uLL54kYfr8Vv"

--OuhxGdI5uLL54kYfr8Vv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

As one of the original developers of the whole "external-toolchain" support=
[1] and still being an active contributor[2], spanning through CodeSourcery=
->Linaro->Arm recipes, I would certainly welcome this move!

BTW, what is the branching strategy for this layer - will there be release=
 branches, like thud, zeus, etc.?

[1] https://git.openembedded.org/openembedded/log/recipes/meta/external-to=
olchain-csl.bb
[2] https://git.linaro.org/openembedded/meta-linaro.git/log/meta-linaro-to=
olchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb

--
Denys

On Thu, Jan 23, 2020 at 02:39 AM, Sumit Garg wrote:

>=20
> Hi Jon and all,
>=20
> As you may be aware that Linaro used to maintain meta-linaro-toolchain
> layer [1] in meta-linaro tree for GCC tool-set releases from Linaro
> till GCC 7.
>=20
> And since GCC 8, the tool-set release and maintenance work was
> transferred to ARM. But meta-linaro-toolchain layer continued support
> for ARM GCC tool-set releases as well.
>=20
> In future, I think meta-arm tree [2] shall be an appropriate place to
> host ARM GCC toolchain recipes as an additional meta-arm-toolchain
> layer. Also, with the latest integration [3] for ARM GCC 9.2 toolchain
> in meta-linaro, recipes are well tested and seems to be stable. So I
> would like to propose import of ARM GCC toolchain recipes into
> meta-arm.
>=20
> I am looking forward to any comments or suggestions regarding this
> proposal.
>=20
> [1] https://git.linaro.org/openembedded/meta-linaro.git/tree/meta-linaro=
-toolchain
>=20
> [2] https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/
> [3] https://lists.yoctoproject.org/g/yocto/message/48094
>=20
> Regards,
> Sumit

--OuhxGdI5uLL54kYfr8Vv
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

As one of the original developers of the whole "external-toolchain" support=
[1] and still being an active contributor[2], spanning through CodeSourcery=
-&gt;Linaro-&gt;Arm recipes, I would certainly welcome this move!<br /><br =
/>BTW, what is the branching strategy for this layer - will there be releas=
e branches, like thud, zeus, etc.?<br /><br />[1]&nbsp;<a href=3D"https://g=
it.openembedded.org/openembedded/log/recipes/meta/external-toolchain-csl.bb=
">https://git.openembedded.org/openembedded/log/recipes/meta/external-toolc=
hain-csl.bb</a><br />[2]&nbsp;<a href=3D"https://git.linaro.org/openembedde=
d/meta-linaro.git/log/meta-linaro-toolchain/recipes-devtools/external-arm-t=
oolchain/external-arm-toolchain.bb">https://git.linaro.org/openembedded/met=
a-linaro.git/log/meta-linaro-toolchain/recipes-devtools/external-arm-toolch=
ain/external-arm-toolchain.bb</a><br /><br />--&nbsp;<br />Denys<br /><br /=
><br />On Thu, Jan 23, 2020 at 02:39 AM, Sumit Garg wrote:<br />
<blockquote>Hi Jon and all,<br /><br />As you may be aware that Linaro use=
d to maintain meta-linaro-toolchain<br />layer [1] in meta-linaro tree for =
GCC tool-set releases from Linaro<br />till GCC 7.<br /><br />And since GCC=
 8, the tool-set release and maintenance work was<br />transferred to ARM. =
But meta-linaro-toolchain layer continued support<br />for ARM GCC tool-set=
 releases as well.<br /><br />In future, I think meta-arm tree [2] shall be=
 an appropriate place to<br />host ARM GCC toolchain recipes as an addition=
al meta-arm-toolchain<br />layer. Also, with the latest integration [3] for=
 ARM GCC 9.2 toolchain<br />in meta-linaro, recipes are well tested and see=
ms to be stable. So I<br />would like to propose import of ARM GCC toolchai=
n recipes into<br />meta-arm.<br /><br />I am looking forward to any commen=
ts or suggestions regarding this proposal.<br /><br />[1] <a href=3D"https:=
//git.linaro.org/openembedded/meta-linaro.git/tree/meta-linaro-toolchain" t=
arget=3D"_blank" rel=3D"noopener">https://git.linaro.org/openembedded/meta-=
linaro.git/tree/meta-linaro-toolchain</a><br />[2] <a href=3D"https://git.y=
octoproject.org/cgit/cgit.cgi/meta-arm/" target=3D"_blank" rel=3D"noopener"=
>https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/</a><br />[3] <a href=
=3D"https://lists.yoctoproject.org/g/yocto/message/48094" target=3D"_blank=
" rel=3D"noopener">https://lists.yoctoproject.org/g/yocto/message/48094</a>=
<br /><br />Regards,<br />Sumit</blockquote>

--OuhxGdI5uLL54kYfr8Vv--
