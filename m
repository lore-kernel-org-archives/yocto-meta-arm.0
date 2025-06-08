Return-Path: <marek.bykowski@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8811C5B552
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 20:14:20 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.44336.1749413654404150709
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 08 Jun 2025 13:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iZV7uDU3;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: marek.bykowski@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c56a3def84so346885185a.0
        for <meta-arm@lists.yoctoproject.org>; Sun, 08 Jun 2025 13:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749413653; x=1750018453; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6rCvt9cXOPzkfRmV9HlJ8el6RxEQCpb4d3rKDf0hnuA=;
        b=iZV7uDU3cRjy+A0PmWQ490PO0L+/9JzSZHWNVgIOcOsH8dcc05v2r5Z2QHWeCY7zxp
         8HZRjgwgjBhfBjRyzouq6gK/433/S/yruoTpMaLs8nVP7G8WursRImzA7i/YdsgSSwnu
         1xuAdDQwP7vv87+8ZiSu2Nz9eNrTjreI7+J5+PrZASSjUIbRSv9yztNLMy6Ohxr123s4
         PjET/BY5FdLNRmBKs6YjTzFKsBdsh7KSW2sl+55sohV2fbIxEHceaun8YjyuquZ1T1hG
         y56/cQ3hbOGQlZDsQX4rPxgxpChaKjc6zkLPQx2s3WuMqg70N1MZrkHy6EqM6XRYRbFb
         pBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749413653; x=1750018453;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6rCvt9cXOPzkfRmV9HlJ8el6RxEQCpb4d3rKDf0hnuA=;
        b=G/ggVx2ryVuogzaL+VWzg2ZAgASYPvqH89eiYZHWh7/fMV0+emyaugIHUuBSqlChRL
         9B6snpJHm7BfCrFaMyiVDHJ8kJ4Q7GNUaUycViVqnYM9nty74CtJLL1ue6gU0f9dYar2
         4KSdWgaS4/inSdmcb/hPgHpWMVE+WMGqJaF6wkJ3boDzdcZ0mTSuRyU8mZrQ7CkD1Qvu
         UCTjVYhyg5MQyMMwt2CKSuHTb6vnmAA8IggX0ZDHbLGHu8QLy+YW7Bl+gAQMJ5HfeHU8
         hV7PGqlvRPbPa7FoL6mvTr+b80iy6eyyyHo0rZYqcv+V663ouD90HfdIT0QXQLnTNnTC
         VB3g==
X-Gm-Message-State: AOJu0Yz87aM8Mbkp68HypA5JKLWNNSMM/2Ixq+DuCjmKheoIe63BOWSp
	K0Qh9gYcdcFiic8dGePmMgprmTIkdeusnPUcw2A4I8KY/3MSy9LmKGTJH2+MHZ9sTiAS5ufj2/R
	jHnHmQXLORgAb5UNz51tSlX4ZoshsPLLC0p+paJgm3w==
X-Gm-Gg: ASbGnctaAsFqCi31MIJjgED+85LfRmEgyYZCoe8DpcHPu0p27T/X74dtrZOhKk62wG+
	fZwZBK7xyfsKflF6Z2A0ZzYDoGjSpqq74iLNnd4iV0W0LZ8BIy+MWBbKRACHAAhpAr/Gs2hMJnQ
	gvHM5TV4m0wPh+Y+PNmKrizFmcPq6FNlXzbAZuO6F4Ohk=
X-Google-Smtp-Source: AGHT+IE1icT/mopKibotnbdcW2mKiLlMgHoqO3Ea84h+EjZ9HLLcLzfh4Voae1bbhZlLf86L4O4fDWI+qtSFszQBbB4=
X-Received: by 2002:a05:620a:4492:b0:7d3:9012:75d6 with SMTP id
 af79cd13be357-7d39012797cmr564436685a.28.1749413653287; Sun, 08 Jun 2025
 13:14:13 -0700 (PDT)
MIME-Version: 1.0
From: Marek <marek.bykowski@gmail.com>
Date: Sun, 8 Jun 2025 22:14:02 +0200
X-Gm-Features: AX0GCFv0-QKPT0Bvd6uAGzsFHwIdboxpiWHqkoOsVnSLOLuhB70AT20g7346eaM
Message-ID: <CAHw2UgDSp9jK_9Q0FsdfiGPdmWmGQRTfiTQoBg=ZrD16q0ucXA@mail.gmail.com>
Subject: fvp-base doesn't support armv8.2
To: meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000005e976e0637151b29"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 08 Jun 2025 20:14:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6533

--0000000000005e976e0637151b29
Content-Type: text/plain; charset="UTF-8"

When I simply change to "require
conf/machine/include/arm/arch-armv8-2a.inc" and
"FVP_CONFIG[cluster0.has_arm_v8-2] = "1"" and
"FVP_CONFIG[cluster1.has_arm_v8-2] = "1" " the FVP_Base_RevC-2xAEMvA
doesn't boot at all. I do not see even a single line of log even from bl1.
Would that mean the SW stack/Yocto doesn't support armv8.2 for fvp-base
model platform?

Thanks,
Marek

--0000000000005e976e0637151b29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>When I simply change to &quot;require conf/machine/in=
clude/arm/arch-armv8-2a.inc&quot; and &quot;FVP_CONFIG[cluster0.has_arm_v8-=
2] =3D &quot;1&quot;&quot; and &quot;FVP_CONFIG[cluster1.has_arm_v8-2] =3D =
&quot;1&quot; &quot; the=C2=A0FVP_Base_RevC-2xAEMvA doesn&#39;t boot at all=
. I do not see even a single line of log even from bl1. Would that mean the=
 SW stack/Yocto doesn&#39;t support armv8.2 for fvp-base model platform?</d=
iv><div><br></div><div>Thanks,</div><div>Marek</div></div>

--0000000000005e976e0637151b29--

