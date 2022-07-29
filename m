Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682C9C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 19:16:44 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.1047.1659122202608426157
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 12:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=ClQ90izL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id u12so4053785qtk.0
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 12:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=Y7tFSSksyggAhzRKDuI6xkr4CQjtHrhwm+7rCJnnxZ0=;
        b=ClQ90izLzCjjXiuRNZe6l+imMxtA/1eNleCMfo6uUGo1QN6nddi1QfB41zGC529DGu
         z36ZDbRnDtWvqqIBP4fVOPJ/h5BeFOiGcdZk9+da/Qbtt4QTz4Bc+Z+yKa6sc8pyUaGO
         LWd5spvF9NBmNAxsA8bsnX4l/5Rw6B/ZwRZ6x7s1RXzUqEFydroTVKmD2mqyEnGS2r/1
         JRr3Fg8ssWY3To0+qomyMvfGI3Gi4dBJWZBiX8+6gNtoPqc8moF1friTlaUzMf1wUbZK
         V7p2/nq6R31avokRPX0L+9dia0g6/XtACpXVlvhaJB08P+/gLrgMtWP30APnvx+4eoHE
         LENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=Y7tFSSksyggAhzRKDuI6xkr4CQjtHrhwm+7rCJnnxZ0=;
        b=Yn1CiRZ0oMpKJVoJmJyYl9eWxkl71H8CM9StVPN81a/xZnj9oLaH/2TRkT/16I3EqK
         xOmPx3hoUUymBBQAfOXN8zssOkvH4aGaGjc8d6QcgqxBo1tMDne/OGarq2u27Sbwfx/D
         ktfs+MHhkkm4vi4TWNqibklOsImnb4ljqIWzD6x3RD4lyOgwCeVyu7lnNzEBBTRxf7Bk
         lXnjrPfbxTLYzGuZPkx/moiEJpIfSVPhFisGfS1aaFY/HjQ0uWLSEBAj5kKBZl9im4kN
         pOhoiB5O14cTBLmD/ezWwx31bWK7gDYV5AUGR6DUQHKfHEcVGlAEvl0JkjV6quwb1vZ1
         gR8Q==
X-Gm-Message-State: AJIora+W4LIMH21KYpG7jcy4Xh+Hd6CSe0rm396s1bRsuaoZqLcQsIlI
	47GALPldRMWg/0j9Qfr3IjsTBDbrMDXJIA==
X-Google-Smtp-Source: 
 AGRyM1vzNjI4IYg7NblCmp9gIipbwIXWRQ7Li6D0J4sivrq0BW2iIakVXn6Za5PJBJCk2q8qZmuSug==
X-Received: by 2002:ac8:5e07:0:b0:31f:73:1394 with SMTP id
 h7-20020ac85e07000000b0031f00731394mr4739917qtx.502.1659122201205;
        Fri, 29 Jul 2022 12:16:41 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 u12-20020a05620a430c00b006af1f0af045sm2963779qko.107.2022.07.29.12.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 12:16:40 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: remove zephyr specific testimage hacks
Date: Fri, 29 Jul 2022 15:16:34 -0400
Message-Id: <165912219591.603629.14772091745616811693.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220727165611.7089-1-jon.mason@arm.com>
References: <20220727165611.7089-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Jul 2022 19:16:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3619

On Wed, 27 Jul 2022 12:56:11 -0400, Jon Mason wrote:
> meta-zephyr recently was fixed to allow for autotest.  Remove all the
> zephyr testing hacks and use that.

Applied, thanks!

[1/1] CI: remove zephyr specific testimage hacks
      commit: 6e4522e1c6b808838d065e36c0967a4a95cdea4f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

