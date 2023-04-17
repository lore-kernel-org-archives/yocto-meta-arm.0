Return-Path: <vvavrychuk@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB88C77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 15:34:03 +0000 (UTC)
Subject: external-arm-toolchain does not support usrmerge
To: meta-arm@lists.yoctoproject.org
From: "Vasyl Vavrychuk" <vvavrychuk@gmail.com>
X-Originating-Location: UA (46.211.90.156)
X-Originating-Platform: Android Phone Chrome 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 17 Apr 2023 08:34:01 -0700
Message-ID: <5vhQ.1681745641245825165.ihN7@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="gbiei6soHBuCuGYyiJYF"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Apr 2023 15:34:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4579

--gbiei6soHBuCuGYyiJYF
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

external-arm-toolchain does not support usrmerge disto feature. It fails on=
 one of the mv commands due to both mv arguments point to the same file in =
case of usrmerge. I've tried to fix this build error by wrapping this move =
under isrmerge enabled check, but unfortunately I get non functional toolch=
ain.

Usrmerge support looks to be important in particular due to systemd plans t=
o drop support of non usrmerge systems.

--gbiei6soHBuCuGYyiJYF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

external-arm-toolchain does not support usrmerge disto feature. It fails on=
 one of the mv commands due to both mv arguments point to the same file in =
case of usrmerge. I've tried to fix this build error by wrapping this move =
under isrmerge enabled check, but unfortunately I get non functional toolch=
ain.<br /><br />Usrmerge support looks to be important in particular due to=
 systemd plans to drop support of non usrmerge systems.

--gbiei6soHBuCuGYyiJYF--

