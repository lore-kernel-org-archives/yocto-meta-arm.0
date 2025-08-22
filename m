Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2632DCA0EEB
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 15:58:29 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.1160.1755878308661006057
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Aug 2025 08:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=mihd3WL7;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-70ba7aa13b3so26711766d6.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 08:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1755878307; x=1756483107; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igIy2OBj4wHZ/S28RXBrrZwGfmbaO1iUJ7e4892a5gE=;
        b=mihd3WL7NT9w0AxDu8Fe1xZIjSb2/1EO9kIt8MdyZxCM9eNwGsP6fgW7UWzVKpYtIF
         aYcvJwZtzMtV9GrGS0MOQb7vdjByfdi9lIYxovbxHm5Ew4NnINlYJJYIh3/t5k5WldWE
         qU1VDCPn8Ewd/LEeGTWZy9JaSp++E4wEEcmTt4+6JC9vkLsWuTuQb4JlnTbvel9P3KCg
         AuUG+RxnvUaPqcCeCXCEtHeVL87/EjTWyNYoREiHUAP2vq3/UA9b6ag7dlALPwryzS4R
         Ln2FJfIgrNT+eaF77QM5JZvYG9Fv156dZhovBqgQJg0cBQbUott0PS9bKtOyjopK2VTw
         djWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755878307; x=1756483107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igIy2OBj4wHZ/S28RXBrrZwGfmbaO1iUJ7e4892a5gE=;
        b=QlF9muxEbKlwxpmKLp7Ob3vqNFlABA2D0/rrw9ORsA6mtqUF5jn17uORsksXzatgrr
         d/JwYm1prdzXkQ4T7RnLgp4U7qduCcZsrfJqzgxe4n0ouaq7RoJm4K8/Zy7pxh9PKKQO
         gKiP05qKWkdkDKManKx3T8o1VQWOWWVEb72ziU7h+F614l+65naDbYZqvDIDjKL0tGQ1
         NPU2JYdy14KcFG8fO2gb+sWVvoxgBDWtVjQRn4brpsY8IckP3bE/wgFlSeYxtvTItwcA
         eV+DwA7oWbELbQEJ339kuHJEh1QouD/YkdH+8/DGqkkDSoRyPGbi5m4SOqkTEfUk8+uB
         mjOg==
X-Gm-Message-State: AOJu0Yy5X27/8+wrY2Ofn9n/tRCyvjsW0lcco2wnrpAI8+BKaj5Hcipc
	p647EVpCTVKOP5PdqeZlZmqvgJedroJw9ZBrm7v4M3GaNnX74tzUPr/AOlOoFbMagGFFsiLoaYQ
	FPHI=
X-Gm-Gg: ASbGnct8OefrsECD7Ilr37JgkiYxOrvbudzue7JAykl21C9aMj0wFBLNkP9f5nKpg/S
	kBu/Tc9C0nmbakx4Y8xiExCKcF3JAreLiPWTpRtOVzmZHr4uwp+4lqxDvVVr0LdLlvJ+7MMiNfd
	wNJhaTuXoIJNO85pMsSqMWEEncvmtMeSbpt3eQ4qO+MOykbiV5FUkYMPxtNtc9KqRYTHJaSu/2x
	pwsmn3IeHGljE6AOd9akwtq5ssMBt1Ixhyc/diyJmXuZYCnuNsP9JdYrSOhr5lsIcCYuDXLlEsL
	03rLFdz5V37ZsKpoYOdnPmNcCptnK+zAP3ee1A0pWCWg+Vq1QspkAz7A79Ao6e9LuSaaozlpj8X
	dCLA+sw/SosAt/m3HruyFxdJb
X-Google-Smtp-Source: AGHT+IG0aWeI+DXsl3Rfn01PU7Bf1EIxwxWysxnXIgQet1T4WcxQ6937DD1Kco67WzUt/xNHS2lW2w==
X-Received: by 2002:a05:6214:cc8:b0:709:dd30:fc62 with SMTP id 6a1803df08f44-70d97342791mr44248206d6.31.1755878307335;
        Fri, 22 Aug 2025 08:58:27 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da714727csm1122046d6.13.2025.08.22.08.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 08:58:26 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm/arch-armv9*: Fix PACKAGE_EXTRA_ARCHS reference
Date: Fri, 22 Aug 2025 11:58:19 -0400
Message-Id: <175587830010.1407857.11260974751326284758.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250822132011.93796-1-jon.mason@arm.com>
References: <20250822132011.93796-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 15:58:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6683


On Fri, 22 Aug 2025 09:20:09 -0400, Jon Mason wrote:
> PACKAGE_EXTRA_ARCHS references armv8 instead of armv9
> 
> 

Applied, thanks!

[1/3] arm/arch-armv9*: Fix PACKAGE_EXTRA_ARCHS reference
      commit: 05b2de0e7a9b71e61c16f7607546b846fb87648c
[2/3] arm-bsp/fvp-base: remove console workaround
      commit: 5442973e13df30e4cde0fab23b2dbafd03a3407d
[3/3] arm/optee-os: remove CFG_CORE_BTI from EXTRA_OEMAKE
      commit: e517e47d2ed44c79ecbdff2a0ef43fc62783b05f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

