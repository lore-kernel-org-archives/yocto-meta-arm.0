Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99D4E8784A
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 16:29:36 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20562.1770136174354026568
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Feb 2026 08:29:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NB1w1a6j;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 229F61A2BC0;
	Tue,  3 Feb 2026 16:29:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E5DE760728;
	Tue,  3 Feb 2026 16:29:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6743119A8891;
	Tue,  3 Feb 2026 17:29:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770136171; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references:autocrypt;
	bh=hI0GxxBYWHN8GYkFHFbGV5f1aRQSEuXG4JfJGJp0NCA=;
	b=NB1w1a6jDcSrIcPOuFky8GlhTj1O8gI6jyoq3ms0JgOKkvuY0Fokm4MYSz4PHOx6GVWtZk
	utN5xIoSFogNZuK2HwOmACTTJCdDHZ6JDBTXTvweCos35EClGXFk6MlCxuOGR/H0oZCBWt
	OEPj7slcWbGMuh0+GI8mo7+jN6dfK6FE+YBFxOTg8DyaPIJ3KreEirCKu4fIcRia3NsJRo
	TVltTslxQjYgwMobSgkWmdk620h/ECmfVm22xjfdfLC6OLSBL9qlicMa1NDW024CBUdR3B
	ZDXcMkQ7vPPDEuACe/KPG3rVVkGvePgS5hm4Zz8n+nVMBuD/HrNJ6zk3Ju9m4w==
Message-ID: <39d5c5061d0c220d37a302b5669df66d04ca41c0.camel@bootlin.com>
Subject: Re: [yocto] [RFC] Moving OP-TEE support from meta-arm to oe-core
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: yocto@lists.yoctoproject.org, raj.khem@gmail.com, ross.burton@arm.com
Cc: "thomas.perrot@bootlin.com" <thomas.perrot@bootlin.com>, 
 "nylon.chen@sifive.com"
	 <nylon.chen@sifive.com>, "peter.lin@sifive.com" <peter.lin@sifive.com>, 
 "meta-arm@lists.yoctoproject.org"
	 <meta-arm@lists.yoctoproject.org>
Date: Tue, 03 Feb 2026 17:29:28 +0100
In-Reply-To: <CAMKF1sq=OEHMM97DiKsdBTnCdSCbsfzTLiADfyUb0=RbVBVYeA@mail.gmail.com>
References: <92b1fbe3da82c19ed2ca7a617077f6055a74f7e3.camel@bootlin.com>
		 <6C7BC2F4-364D-41C1-87CB-755547FE281E@arm.com>
		 <CAMKF1sq=OEHMM97DiKsdBTnCdSCbsfzTLiADfyUb0=RbVBVYeA@mail.gmail.com>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=mQGNBF+/ZOUBDAC2DghCjZvmgYcve02OG7dGZ7Iy58uEwne3LB7w7nRwdAxKw7ZaiVqwY
 O+yNGVi+GVx7oA6Wn4pv46z+QDRLQiq6OseuXhkSGCg7U/yBCUq12B/GRGO1Qt2Qi1mJJT1s+1qZ5
 Gxv6Nypz9qKVn94GM2bR1hXBga0t87vBpebThOHmX5d/0dqIcVxRCM7onNb0dDyRoVgLS5rBhQzrL
 CMrJaCy39xZUy0J1SOlH4Mgk6EhJIPYY4wlzikGX6urg+Tc9EjGd78ry0e0p5U5qgjFR5QGJDy1Gn
 U3CfwbT9sowdCASDbQDUoltlv2iWJCLa0xl97KVchCa0pr7HKbFA3J5SLKqFYUBCkFL+5WudYlz2n
 XxiUgyviMQxyK+ij66kEi6/2zFDAecd43pHV7790ptqZBC3Jc67Emj7Vo3ShX6RXPPxxbeCTOF2uk
 I45aJ9XcVFH/MFE96NjXj8uahnIsiTPyuCUoJu8tj7TSQyue874qJqVQvqlFyt2aZYJZ8ruq8AEQE
 AAbQpVGhvbWFzIFBlcnJvdCA8dGhvbWFzLnBlcnJvdEBib290bGluLmNvbT6JAc4EEwEIADgCGwMF
 CwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCX79mdwAKCRCfw
 AsFcf4K7fhbC/wP0kSl6id2E/K3+UdXk6CLMVRbCFLCREzQs5WFpQ6l/I0WGOamhrOgegdszheiVF
 orlUP8d37XSpFAqydhKGaN78V5Dps0Wmwm4lIlS4MtQXJtSLUHXDJLIZLW0pw8tiPLKsd1o/yDkXE
 dnpsjJTRG6SdDSHnyOB2/gh4p+yTaLytFdARk/r4/P26+L+FiH0fFl+RnBt19LPklfKgeDc7GwIif
 ja+nIWpp3W23DAUuI6xduEut25Q89yu7Ci8CliLfAiLy9bIGjBQWU2Y+1/j/7KuPj6VbBsZWLTZY0
 hUmpJSTnWAqc9SMsNxo7NSQuddgviz5e2tqucaRqxP02FGzNa8U4NAKdWaXrlHG5Dglj9XH0DK+SH
 +c96qqFewYD8VPQ6XAGxQcXbrtJmiMor1R2DfziispLRvJcfYs8xqabbCtoS3ouXB9XRi8hn7A2kh
 ME1ryS+Oh63JshXHnw6bmjCpVd/p+fGLIGU6A47pJOpviKR4jEO84pl2ejtDZ3Tc=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-e6rral5v7LeCyHAD+aiZ"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 Feb 2026 16:29:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6885


--=-e6rral5v7LeCyHAD+aiZ
Content-Type: multipart/alternative; boundary="=-ABscI0Fc7iuZdwvnAqED"

--=-ABscI0Fc7iuZdwvnAqED
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, 2026-01-22 at 09:22 -0800, Khem Raj via lists.yoctoproject.org
wrote:
>=20
>=20
> On Thu, Jan 22, 2026 at 9:05=E2=80=AFAM Ross Burton via
> lists.yoctoproject.org <ross.burton=3Darm.com@lists.yoctoproject.org>
> wrote:
> > On 22 Jan 2026, at 09:33, Thomas Perrot via lists.yoctoproject.org
> > <thomas.perrot=3Dbootlin.com@lists.yoctoproject.org> wrote:
> > >=20
> > > Hi,
> > >=20
> > > Currently, OP-TEE support is maintained in the meta-arm layer.
> > However,
> > > OP-TEE is now being adopted by non-ARM platforms as well, notably
> > RISC-
> > > V.
> > >=20
> > > Given this broader adoption, would it make sense to move the OP-
> > TEE
> > > recipes from meta-arm to oe-core?
> > >=20
> > > I'd like to hear the community's thoughts on this.
> >=20
> > Copying in the meta-arm list.
> >=20
> > My immediate thought on this is =E2=80=9Cwould the riscv machines actua=
lly
> > use the same recipes=E2=80=9D or is there enough forking and vendor
> > branches happening that whilst in theory everyone is using OP-TEE,
> > they=E2=80=99re not all using the _same_ optee.
> >=20
> > I=E2=80=99m not against moving genuinely shared recipes somewhere commo=
n,
> > but I do think verifying this will actually happen is important.
> >=20
> > meta-arm tends to have several versions of optee at once for good
> > reason=E2=80=A6 (currently one, but about to be two)
> >=20
> >=20
>=20
>=20
> I think its=C2=A0a good idea, but Ross's point is good too. If optee is
> forked for every architecture that can not be a good thing. However,
> if we can get
> qemuarm64 and qemuriscv64 based machines use an upstream version
> reliably, we might be able to even help upstream to keep things sane
> atleast for emulated=C2=A0machine=C2=A0architecture, similar to u-boot.
> =C2=A0

I agree with this approach. It's worth noting that OP-TEE upstream
already runs their test suite (xtest) on QEMU. This gives us confidence
that the upstream version works reliably on emulated machines.=20

                                                                           =
                                                                           =
                                                                           =
                                                                           =
                 =20
Starting with qemuarm64 and qemuriscv64 support in oe-core using
upstream OP-TEE would be a reasonable first step, leaving vendor-
specific versions and hardware-specific configurations in their
respective layers.

Kind regards,
Thomas Perrot

> > Ross
> >=20
> >=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#66180):
> https://lists.yoctoproject.org/g/yocto/message/66180
> Mute This Topic: https://lists.yoctoproject.org/mt/117397331/5443093
> Group Owner: yocto+owner@lists.yoctoproject.org
> Unsubscribe:
> https://lists.yoctoproject.org/g/yocto/unsub=C2=A0[thomas.perrot@bootlin.=
com
> ]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--=-ABscI0Fc7iuZdwvnAqED
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body style=3D"overflow-wrap: break-word; -webkit-nbsp-mode:=
 space; line-break: after-white-space;"><div>Hello,</div><div><br>On Thu, 2=
026-01-22 at 09:22 -0800, Khem Raj via lists.yoctoproject.org wrote:</div><=
blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fc=
f solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><=
div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, Jan 22, 2026 at 9:05=E2=80=AFAM Ross Burton via <a href=
=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;ross.burt=
on=3D<a href=3D"mailto:arm.com@lists.yoctoproject.org">arm.com@lists.yoctop=
roject.org</a>&gt; wrote:<br></div><blockquote type=3D"cite" style=3D"margi=
n:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div>On 22 Ja=
n 2026, at 09:33, Thomas Perrot via <a href=3D"http://lists.yoctoproject.or=
g" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> &lt;thom=
as.perrot=3D<a href=3D"mailto:bootlin.com@lists.yoctoproject.org" target=3D=
"_blank">bootlin.com@lists.yoctoproject.org</a>&gt; wrote:<br>&gt; <br>&gt;=
 Hi,<br>&gt; <br>&gt; Currently, OP-TEE support is maintained in the meta-a=
rm layer. However,<br>&gt; OP-TEE is now being adopted by non-ARM platforms=
 as well, notably RISC-<br>&gt; V.<br>&gt; <br>&gt; Given this broader adop=
tion, would it make sense to move the OP-TEE<br>&gt; recipes from meta-arm =
to oe-core?<br>&gt; <br>&gt; I'd like to hear the community's thoughts on t=
his.<br></div><div><br>Copying in the meta-arm list.<br></div><div><br>My i=
mmediate thought on this is =E2=80=9Cwould the riscv machines actually use =
the same recipes=E2=80=9D or is there enough forking and vendor branches ha=
ppening that whilst in theory everyone is using OP-TEE, they=E2=80=99re not=
 all using the _same_ optee.<br></div><div><br>I=E2=80=99m not against movi=
ng genuinely shared recipes somewhere common, but I do think verifying this=
 will actually happen is important.<br></div><div><br>meta-arm tends to hav=
e several versions of optee at once for good reason=E2=80=A6 (currently one=
, but about to be two)<br></div><div><br></div><div><br></div></blockquote>=
<div><br></div><div>I think its&nbsp;a good idea, but Ross's point is good =
too. If optee is forked for every architecture that can not be a good thing=
. However, if we can get</div><div>qemuarm64 and qemuriscv64 based machines=
 use an upstream version reliably, we might be able to even help upstream t=
o keep things sane</div><div>atleast for emulated&nbsp;machine&nbsp;archite=
cture, similar to u-boot.</div><div>&nbsp;</div></div></div></blockquote><d=
iv><br></div><div><div>I agree with this approach. It's worth noting that O=
P-TEE upstream already runs their test suite (xtest) on QEMU. This gives us=
 confidence that the upstream version works reliably on emulated machines. =
                                                        </div><div><br></di=
v><div>                                                                    =
                                                                           =
                                                                           =
                                                                           =
                         </div><div>  Starting with qemuarm64 and qemuriscv=
64 support in oe-core using upstream OP-TEE would be a reasonable first ste=
p, leaving vendor-specific versions and hardware-specific configurations in=
 their respective layers.<br></div></div><div><br>Kind regards,<br>Thomas P=
errot<br><br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bo=
rder-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote gmail_quote_container"><blockquote type=3D"cite" style=3D"m=
argin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div>Ross=
<br></div><div><br></div><div><br></div></blockquote></div></div><div><br><=
/div><div>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br></div><div>Links=
: You receive all messages sent to this group.<br></div><div>View/Reply Onl=
ine (#66180): <a href=3D"https://lists.yoctoproject.org/g/yocto/message/661=
80">https://lists.yoctoproject.org/g/yocto/message/66180</a><br></div><div>=
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/117397331/544=
3093">https://lists.yoctoproject.org/mt/117397331/5443093</a><br></div><div=
>Group Owner: <a href=3D"mailto:yocto+owner@lists.yoctoproject.org">yocto+o=
wner@lists.yoctoproject.org</a><br></div><div>Unsubscribe: <a href=3D"https=
://lists.yoctoproject.org/g/yocto/unsub">https://lists.yoctoproject.org/g/y=
octo/unsub</a>&nbsp;[<a href=3D"mailto:thomas.perrot@bootlin.com">thomas.pe=
rrot@bootlin.com</a>]<br></div><div>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-<br></div><div><br></div></blockquote><div><br></div><div><span><pr=
e>-- <br></pre><pre>Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

</pre></span></div></body></html>

--=-ABscI0Fc7iuZdwvnAqED--

--=-e6rral5v7LeCyHAD+aiZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmmCImgACgkQn8ALBXH+
Cu0aHQv/TV3qUt4ODQdFVW11LDpSdzNnUYB3PAZP+VNMfsC6H0ZTwdBCM+ARjpKH
I739FjCz/mItAiXBHkT/+sQtwrndQ1kjVSjfbM54P2dLs9wUyAffCfcKpUMDaA4b
H2N6vDaTKVwyL+/5s3VO27nP6m9F1A0dLShIZWD9KA//4v++QPC7Mp057O5HG52d
I9hJcDzrpaXOIuTL/T9wlqsVmVqhzq0R2AwhSvoS8QgP7tm0orXmOZU2psSs6ebh
QHpqXZket1drMoqeR3GaTm+INgr5IC8ctBvb2r1Zp3SiVabrE7tow3bfuJZOBfbY
Lhew2OyNN/s26kJepDekyipuanW/CCOvzYtJMh+yDet4S4YqgLCEQSXNopDmi5CU
6loMcLA9+cEWwLR4LvjE6jJ1ixqEyieXNuUT8JxxZnUFiamoegF9JethtnmwEqtx
oa0drxj/E0nWxtoddZIF1gUBi3WaGfTSyRwrokW2YIOT9mQqsIIGr17sc/OnRUuu
EYKEqAct
=jIyD
-----END PGP SIGNATURE-----

--=-e6rral5v7LeCyHAD+aiZ--

