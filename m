Subject: Re: meta-arm layer update
To: meta-arm@lists.yoctoproject.org
From: "Denys Dmytriyenko" <denis@denix.org>
X-Originating-Location: Arlington, Virginia, US (207.244.106.50)
X-Originating-Platform: Linux Chrome 79
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 27 Jan 2020 16:16:45 -0800
References: <CAP71Wjwxwxxzxn=4ErvE7C4mPa+UnhQQH_b+-13QLDxsTp4Lkg@mail.gmail.com>
In-Reply-To: <CAP71Wjwxwxxzxn=4ErvE7C4mPa+UnhQQH_b+-13QLDxsTp4Lkg@mail.gmail.com>
Message-ID: <8728.1580170605021870328@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="qbUhaVee9EkMiLc7VIyj"

--qbUhaVee9EkMiLc7VIyj
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

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

Nico,

Do you have a timeline for this transition? Thanks.

Denys

>=20
> 2. I have very quickly browsed through the files, and noticed that you
> are setting DISTRO_FEATURES within machine configuration meta data
> (juno.conf), this really needs to be removed, as it's a bad practice.
> If someone builds their own distro/apps for 'juno' you shouldn't
> change their distro config.
> 3. We have some juno machine definition in meta-96boards, and we
> should look at cleaning things up a bit to avoid duplication
>=20
>=20
>>=20
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

--qbUhaVee9EkMiLc7VIyj
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2020 at 12:33 AM, Nicolas Dechesne wrote:<br />
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
 be<br />looking into that soon.</blockquote>
Nico,<br /><br />Do you have a timeline for this transition? Thanks.<br />=
<br />Denys<br /><br /><br />
<blockquote>2. I have very quickly browsed through the files, and noticed =
that you<br />are setting DISTRO_FEATURES within machine configuration meta=
 data<br />(juno.conf), this really needs to be removed, as it's a bad prac=
tice.<br />If someone builds their own distro/apps for 'juno' you shouldn't=
<br />change their distro config.<br />3. We have some juno machine definit=
ion in meta-96boards, and we<br />should look at cleaning things up a bit t=
o avoid duplication<br /><br />
<blockquote><br />Also, some of the layers are now present on the OpenEmbe=
dded layer<br />index. Specifically,<br /><a href=3D"http://layers.openembe=
dded.org/layerindex/branch/master/layer/meta-arm-bsp/" target=3D"_blank" re=
l=3D"noopener">http://layers.openembedded.org/layerindex/branch/master/laye=
r/meta-arm-bsp/</a><br /><a href=3D"http://layers.openembedded.org/layerind=
ex/branch/master/layer/meta-arm/" target=3D"_blank" rel=3D"noopener">http:/=
/layers.openembedded.org/layerindex/branch/master/layer/meta-arm/</a><br />=
<br />The meta-arm-iota layer was rejected due to not having a distro<br />=
definition in it, and generally being empty. I will attempt to add it<br />=
again once code has been pushed to that location.<br /><br /><br />Thanks,<=
br />Jon<br />IMPORTANT NOTICE: The contents of this email and any attachme=
nts are confidential and may also be privileged. If you are not the intende=
d recipient, please notify the sender immediately and do not disclose the c=
ontents to any other person, use it for any purpose, or store or copy the i=
nformation in any medium. Thank you.</blockquote>
</blockquote>

--qbUhaVee9EkMiLc7VIyj--
