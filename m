Return-Path: <m.felsch@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA04C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 11:02:24 +0000 (UTC)
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18641.1782817335696192392
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 04:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=syntax error for token:  (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: mfe@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A13BA20094B;
	Tue, 30 Jun 2026 13:02:08 +0200 (CEST)
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1weWEC-005Oo2-1q;
	Tue, 30 Jun 2026 13:02:08 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1weWEC-00000008DWE-1zTf;
	Tue, 30 Jun 2026 13:02:08 +0200
Date: Tue, 30 Jun 2026 13:02:08 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, yocto@pengutronix.de
Subject: Re: [meta-arm] [PATCH] arm/optee: upate to 4.10.0
Message-ID: <qfi575bkmnjx76usxmbnfnelahe6brhxiwo4bcor3eaevrjw6s@6ozy5ubsfvnz>
References: <20260608-mfe-optee-4-10-0-v1-1-83f4f4119c71@pengutronix.de>
 <CAPoiz9xpqaWrJhQfsyxigDt+arTtqQ508iE1m06FBPyAnY6kEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPoiz9xpqaWrJhQfsyxigDt+arTtqQ508iE1m06FBPyAnY6kEg@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Jun 2026 11:02:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7098

On 26-06-14, Jon Mason wrote:
> Your patch breaks corstone1000 because that platform has
> PREFERRED_VERSION_optee-os ?=3D "4.9.%"
> PREFERRED_VERSION_optee-client ?=3D "4.9.%"
>=20
> But that recipe has been removed.  You can see it in CI at:
> https://gitlab.com/jonmason00/meta-arm/-/pipelines/2585833357
>=20
> There is some other noise in there because of upstream breakage, but
> you get the idea.
>=20
> Also, we should at least keep the optee git recipes at the latest
> release (and probably newer than that too).
>=20
> TLDR; this patch is incomplete.
>=20
> I've had this optee update coming for a while, but the review has
> taken longer than expected.  You can see it at:
> https://gitlab.com/jonmason00/meta-arm/-/commit/d830ddc1fe0339422f5419d=
ffc4575c2cd322ccb
>=20
> If you want to copy it and send it as a v2, I'd be inclined to take
> it.  Otherwise, I hope to have my version out on Monday.

Thanks for the heads-up, I've seen that your version already landed :)

Would be nice if meta-arm would update the components more regularly.

Regards,
  Marco

>=20
>=20
> Thanks,
> Jon
>=20
> On Mon, Jun 8, 2026 at 2:39=E2=80=AFPM Marco Felsch via lists.yoctoproj=
ect.org
> <m.felsch=3Dpengutronix.de@lists.yoctoproject.org> wrote:
> >
> > Update all OP-TEE components to the latest 4.10.0 release.
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  .../optee/{optee-client_4.9.0.bb =3D> optee-client_4.10.0.bb}       =
    | 2 +-
> >  .../optee/{optee-examples_4.9.0.bb =3D> optee-examples_4.10.0.bb}   =
    | 2 +-
> >  .../optee/{optee-os-tadevkit_4.9.0.bb =3D> optee-os-tadevkit_4.10.0.=
bb} | 0
> >  .../recipes-security/optee/{optee-os_4.9.0.bb =3D> optee-os_4.10.0.b=
b}  | 4 ++--
> >  .../optee/{optee-test_4.9.0.bb =3D> optee-test_4.10.0.bb}           =
    | 4 ++--
> >  5 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta-arm/recipes-security/optee/optee-client_4.9.0.bb b/=
meta-arm/recipes-security/optee/optee-client_4.10.0.bb
> > similarity index 90%
> > rename from meta-arm/recipes-security/optee/optee-client_4.9.0.bb
> > rename to meta-arm/recipes-security/optee/optee-client_4.10.0.bb
> > index b5c3f0a29eead8d7f440bc3b5f8b390280680f68..0d28c76f1f4fa03192822=
426c2ea1a74f7e1944e 100644
> > --- a/meta-arm/recipes-security/optee/optee-client_4.9.0.bb
> > +++ b/meta-arm/recipes-security/optee/optee-client_4.10.0.bb
> > @@ -1,4 +1,4 @@
> >  require recipes-security/optee/optee-client.inc
> >
> > -# v4.9.0
> > +# v4.10.0
> >  SRCREV =3D "9f5e90918093c1d1cd264d8149081b64ab7ba672"
> > diff --git a/meta-arm/recipes-security/optee/optee-examples_4.9.0.bb =
b/meta-arm/recipes-security/optee/optee-examples_4.10.0.bb
> > similarity index 91%
> > rename from meta-arm/recipes-security/optee/optee-examples_4.9.0.bb
> > rename to meta-arm/recipes-security/optee/optee-examples_4.10.0.bb
> > index 7c9bd97246ea9c8591cd74df896a6ea90c3b2aa0..15fddb79206daad4218d8=
48fa64a3c4fe9106b3d 100644
> > --- a/meta-arm/recipes-security/optee/optee-examples_4.9.0.bb
> > +++ b/meta-arm/recipes-security/optee/optee-examples_4.10.0.bb
> > @@ -1,4 +1,4 @@
> >  require recipes-security/optee/optee-examples.inc
> >
> > -# v4.9.0
> > +# v4.10.0
> >  SRCREV =3D "934c7edb74a26e90f68024cf441073528444177f"
> > diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.9.0.=
bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_4.10.0.bb
> > similarity index 100%
> > rename from meta-arm/recipes-security/optee/optee-os-tadevkit_4.9.0.b=
b
> > rename to meta-arm/recipes-security/optee/optee-os-tadevkit_4.10.0.bb
> > diff --git a/meta-arm/recipes-security/optee/optee-os_4.9.0.bb b/meta=
-arm/recipes-security/optee/optee-os_4.10.0.bb
> > similarity index 53%
> > rename from meta-arm/recipes-security/optee/optee-os_4.9.0.bb
> > rename to meta-arm/recipes-security/optee/optee-os_4.10.0.bb
> > index cd369382c3c4c378c7e782e3dcd6b01fd436b114..b4c6cccaa210870a414af=
d776efdcf8cb7be2a59 100644
> > --- a/meta-arm/recipes-security/optee/optee-os_4.9.0.bb
> > +++ b/meta-arm/recipes-security/optee/optee-os_4.10.0.bb
> > @@ -2,5 +2,5 @@ require recipes-security/optee/optee-os.inc
> >
> >  DEPENDS +=3D "dtc-native"
> >
> > -# 4.9.0
> > -SRCREV =3D "c2b0684fcd89929976a8726e6e3af922b48dd2c7"
> > +# 4.10.0
> > +SRCREV =3D "753afbbee1682f5d16fd30e87b31058a4fd4f4b8"
> > diff --git a/meta-arm/recipes-security/optee/optee-test_4.9.0.bb b/me=
ta-arm/recipes-security/optee/optee-test_4.10.0.bb
> > similarity index 92%
> > rename from meta-arm/recipes-security/optee/optee-test_4.9.0.bb
> > rename to meta-arm/recipes-security/optee/optee-test_4.10.0.bb
> > index 2cd5fc5c53e4726d9c6f0545db22dabae48635ef..f392a43e475c41af57afd=
04e8959aba824aa341d 100644
> > --- a/meta-arm/recipes-security/optee/optee-test_4.9.0.bb
> > +++ b/meta-arm/recipes-security/optee/optee-test_4.10.0.bb
> > @@ -1,7 +1,7 @@
> >  require recipes-security/optee/optee-test.inc
> >
> > -# v4.9.0
> > -SRCREV =3D "b27648ea8472cceceb8dda368a965c709066f7aa"
> > +# v4.10.0
> > +SRCREV =3D "88c93e87a5c172363ee986ded036a25cafcc9d2c"
> >
> >  LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da8fa504109e4cd7ea575bc=
49ea4be560 \
> >                      file://LICENSE-BSD;md5=3Ddca16d6efa93b55d0fd662a=
e5cd6feeb \
> >
> > ---
> > base-commit: 02d361b4359fde9b6646129980f1484f7aa5b09e
> > change-id: 20260608-mfe-optee-4-10-0-d9e3c70ca845
> >
> > Best regards,
> > --
> > Marco Felsch <m.felsch@pengutronix.de>
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7071): https://lists.yoctoproject.org/g/meta-arm/=
message/7071
> > Mute This Topic: https://lists.yoctoproject.org/mt/119711029/3616920
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason=
@kudzu.us]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>=20

--=20
#gernperDu=20
#CallMeByMyFirstName

Pengutronix e.K.                           |                             =
|
Steuerwalder Str. 21                       | https://www.pengutronix.de/ =
|
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    =
|

