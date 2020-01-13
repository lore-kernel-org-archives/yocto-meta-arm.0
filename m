Subject: Re: meta-arm layer update
To: meta-arm@lists.yoctoproject.org
From: "Bertrand" <bertrand.marquis@arm.com>
X-Originating-Location: Cambridge, England, GB (217.140.106.52)
X-Originating-Platform: Mac Safari 13
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 13 Jan 2020 01:30:11 -0800
References: <CAP71Wjwxwxxzxn=4ErvE7C4mPa+UnhQQH_b+-13QLDxsTp4Lkg@mail.gmail.com>
In-Reply-To: <CAP71Wjwxwxxzxn=4ErvE7C4mPa+UnhQQH_b+-13QLDxsTp4Lkg@mail.gmail.com>
Message-ID: <2596.1578907811326950752@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="HsTeJjC55lJq7n88fhe5"

--HsTeJjC55lJq7n88fhe5
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On Fri, Jan 10, 2020 at 12:33 AM, Nicolas Dechesne wrote:

>=20
> hi Jon!
>=20
> On Tue, Jan 7, 2020 at 11:35 PM Jon Mason <jon.mason@arm.com> wrote:
>=20
>> The meta-arm layer is now publicly available at
>> https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/
>>=20
>> It is still under active development, and I encourage everyone who woul=
d
>> like to contribute to read
>> https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/README.md
>=20
> many thanks for starting this effort!
>=20
> Some initial comments/thoughts:
>=20
> 1. We are interested in moving the OP-TEE recipes that we've
> maintained in meta-linaro for quite some time, over there. We will be
> looking into that soon.
> 2. I have very quickly browsed through the files, and noticed that you
> are setting DISTRO_FEATURES within machine configuration meta data
> (juno.conf), this really needs to be removed, as it's a bad practice.
> If someone builds their own distro/apps for 'juno' you shouldn't
> change their distro config.

In order to have a working setup on Juno, I need to enable usb and usb mas=
s storage.
The other solution could be to enable this directly in the kernel configur=
ation and not using the DISTRO_FEATURES but the someone activating or turni=
ng off those features would not get the wanted behaviour.
What would be your suggestion here to solve this issue ?

>=20
> 3. We have some juno machine definition in meta-96boards, and we
> should look at cleaning things up a bit to avoid duplication

Definitely agree here. Maybe the definition should just be remove in 96boa=
rds after checking that we provide the same functionalities.
When I implemented the Juno BSP, I did check the 96boards so I think we ha=
ve at least the same features in meta-arm but it would be good to have an o=
ther check on this.

>=20
>=20
>=20
>> Also, some of the layers are now present on the OpenEmbedded layer
>> index. Specifically,
>> http://layers.openembedded.org/layerindex/branch/master/layer/meta-arm-=
bsp/
>>=20
>> http://layers.openembedded.org/layerindex/branch/master/layer/meta-arm/
>>=20
>> The meta-arm-iota layer was rejected due to not having a distro
>> definition in it, and generally being empty. I will attempt to add it
>> again once code has been pushed to that location.
>>=20
>>=20
>> Thanks,
>> Jon
>> IMPORTANT NOTICE: The contents of this email and any attachments are
>> confidential and may also be privileged. If you are not the intended
>> recipient, please notify the sender immediately and do not disclose the
>> contents to any other person, use it for any purpose, or store or copy =
the
>> information in any medium. Thank you.
>=20
>

--HsTeJjC55lJq7n88fhe5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,<br /><br />On Fri, Jan 10, 2020 at 12:33 AM, Nicolas Dechesne wrot=
e:<br />
<blockquote>hi Jon!<br /><br />On Tue, Jan 7, 2020 at 11:35 PM Jon Mason &=
lt;jon.mason@arm.com&gt; wrote:<br />
<blockquote>The meta-arm layer is now publicly available at<br /><a href=
=3D"https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/" target=3D"_blank=
" rel=3D"noopener">https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/</a>=
<br /><br />It is still under active development, and I encourage everyone =
who would<br />like to contribute to read<br /><a href=3D"https://git.yocto=
project.org/cgit/cgit.cgi/meta-arm/tree/README.md" target=3D"_blank" rel=3D=
"noopener">https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/README.=
md</a></blockquote>
many thanks for starting this effort!<br /><br />Some initial comments/tho=
ughts:<br /><br />1. We are interested in moving the OP-TEE recipes that we=
've<br />maintained in meta-linaro for quite some time, over there. We will=
 be<br />looking into that soon.<br />2. I have very quickly browsed throug=
h the files, and noticed that you<br />are setting DISTRO_FEATURES within m=
achine configuration meta data<br />(juno.conf), this really needs to be re=
moved, as it's a bad practice.<br />If someone builds their own distro/apps=
 for 'juno' you shouldn't<br />change their distro config.</blockquote>
In order to have a working setup on Juno, I need to enable usb and usb mas=
s storage.<br />The other solution could be to enable this directly in the =
kernel configuration and not using the DISTRO_FEATURES but the someone acti=
vating or turning off those features would not get the wanted behaviour.<br=
 />What would be your suggestion here to solve this issue ?<br /><br />
<blockquote>3. We have some juno machine definition in meta-96boards, and =
we<br />should look at cleaning things up a bit to avoid duplication</block=
quote>
Definitely agree here. Maybe the definition should just be remove in 96boa=
rds after checking that we provide the same functionalities.<br />When I im=
plemented the Juno BSP, I did check the 96boards so I think we have at leas=
t the same features in meta-arm but it would be good to have an other check=
 on this.<br /><br />
<blockquote><br />
<blockquote>Also, some of the layers are now present on the OpenEmbedded l=
ayer<br />index. Specifically,<br /><a href=3D"http://layers.openembedded.o=
rg/layerindex/branch/master/layer/meta-arm-bsp/" target=3D"_blank" rel=3D"n=
oopener">http://layers.openembedded.org/layerindex/branch/master/layer/meta=
-arm-bsp/</a><br /><a href=3D"http://layers.openembedded.org/layerindex/bra=
nch/master/layer/meta-arm/" target=3D"_blank" rel=3D"noopener">http://layer=
s.openembedded.org/layerindex/branch/master/layer/meta-arm/</a><br /><br />=
The meta-arm-iota layer was rejected due to not having a distro<br />defini=
tion in it, and generally being empty. I will attempt to add it<br />again =
once code has been pushed to that location.<br /><br /><br />Thanks,<br />J=
on<br />IMPORTANT NOTICE: The contents of this email and any attachments ar=
e confidential and may also be privileged. If you are not the intended reci=
pient, please notify the sender immediately and do not disclose the content=
s to any other person, use it for any purpose, or store or copy the informa=
tion in any medium. Thank you.</blockquote>
</blockquote>

--HsTeJjC55lJq7n88fhe5--
