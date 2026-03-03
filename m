Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21549EC1459
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 14:31:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19757.1772548290974669770
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 06:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Z9Jn1yTh;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 15B891A2357;
	Tue,  3 Mar 2026 14:31:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D8F085FF29;
	Tue,  3 Mar 2026 14:31:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1301110368EA9;
	Tue,  3 Mar 2026 15:31:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772548288;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:autocrypt;
	bh=PZrwJ6c7LQPJpI0sntcjG4xsR68wS1CsfI9F3zkcy/s=;
	b=Z9Jn1yThGEvblQ0SrEpkRL27QhQ6XCmPGvWpD/oV1AtbM3bvIrS5V0/FHXGqcLq+NhQBgu
	T8JyxTgEHrlIk2+ZAWinKNmi78OsHB5nmY+R3lHxaAcml3qdyy8varNpeb7kuOyF0Onf8B
	+J1ozaBNs9C2vx7yExLsWZugjiBjISdov9KM8Ivzs+GxT9SsXEQz5bwYkLQrNUA0gXZ6Tk
	p1WEY5kzLPoEmPDuV9ojosTsxSZV18oxu7KjmV76H4GaPAlXdLesSLGwTnG5h0tjWviB+U
	U5GQn7CY0DgLFnACPTLW9326dj57IydF18wd9xp2L5HFf8sqM7PNvQuCucEMog==
Message-ID: <84f4a7735a6ba8af9dfd8d314c71ed02cf4ee7a5.camel@bootlin.com>
Subject: Re: [RFC] Moving OP-TEE support from meta-arm to oe-core
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: yocto@lists.yoctoproject.org
Cc: "thomas.perrot@bootlin.com" <thomas.perrot@bootlin.com>, 
	meta-arm@lists.yoctoproject.org, nylon.chen@sifive.com,
 peter.lin@sifive.com,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Mar 2026 15:31:25 +0100
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
	protocol="application/pgp-signature"; boundary="=-kqTsUovuQgz0y7GcEc8x"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 Mar 2026 14:31:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6934


--=-kqTsUovuQgz0y7GcEc8x
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I'm following up on the RFC I sent in January [1] about moving OP-TEE
support from meta-arm to oe-core.                                    =20
  =20
Thank you to everyone who participated in the discussion, Ross, Khem,
Sumit, Rahul and John.                                               =20
                 =20
OP-TEE is being adopted on RISC-V (non-ARM) platforms, and having it in
oe-core would avoid duplication and fragmentation across layers,
consolidate generic parts, and make it accessible without a dependency
on the ARM BSP layer. This follows the same model as U-Boot, which was
seen as a valid precedent.

Please let us know if you have any remaining concerns or objections,
then to move forward and maybe prepare a first patch series adding OP-
TEE recipes to oe-core with support for qemuarm64 and qemuriscv64 as a
first step.

Kind Regards,
Thomas Perrot

[1]
https://lore.kernel.org/all/39d5c5061d0c220d37a302b5669df66d04ca41c0.camel@=
bootlin.com/

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--=-kqTsUovuQgz0y7GcEc8x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmmm8L4ACgkQn8ALBXH+
Cu1HBgv8CBNSq6tCN/y/Ri/O+mn91XVTwP3js4Knb1zysaFtrMivzCZOpbVOUAAG
ydBQYxbsqH69JblO48icpddiz90GxWtGUKy0dq1ubAsk0Pam0WgzAknUwR6lDlUG
L1uH+774t0+7inrn2W4kLfpCDFjOLG6PAkHi1ljeqO1ZgSDo+oiw/oYLEv4lh0rO
HkbYdYbLwKvQ5Tk+Z5+3KKxu1TYpDZ71G0fg8Zs4WC1z31zoWmII/yAZE4L0i2+O
LCoqpL2+6ipvLRd7qwd/mws3J2glppcgiIUDnd799ajknp58dsNs0qGhsBMAiNg8
w9Q712N16SP1Y+00HR5DOofoydkkYbOkCnQgDkWuTJDptUQi900VRtjbftCAQrFg
mWY38nRh3Z6dio5Wnkibd1a9J4+msXvFnG6y4T8lQCQOwFh8nnetFrqXCiCJNq39
YCMh+/TOMncgEVZluY0bq+29y5vwANeg0MpXaEy951DdTEnPMjAj5I30zJO7NoCd
L1yJ6kWG
=BTeG
-----END PGP SIGNATURE-----

--=-kqTsUovuQgz0y7GcEc8x--

