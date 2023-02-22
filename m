Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E67EC64EC7
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 16:39:58 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.13832.1677083991431709270
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 08:39:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=PhdtF/7k;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id y3so8903380qvn.4
        for <meta-arm@lists.yoctoproject.org>; Wed, 22 Feb 2023 08:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Svzt6/iLHU+CC2V5pTldKL48X2UmEGEzwqNRlDxdw4=;
        b=PhdtF/7kTjksGzPFTYpA0RE6jIipZ7w73RjVVJJZ+eo27Se1vOhtzuYf5YXiPK/YMV
         m2KDcJstZJ/z3dPbJKVIjGv+euXWfANwRXiWLw9KpZIt0AXGRFxEtcRLJa9fl0R4Tnm0
         gUD7gSG9GhyA71kroSrgDfVAicPpxj+JvMMObQNv1kfxj0vbpE3HpdsUaOPOVgQirHL9
         g7VwNMm1x0Fwl8UBPhjY3GQWsl4O0DwrZCXHxEiJalhDxwR8KVGOMi1IdM0XApwsTmWC
         OC5KJf9bFLrPozT8BGjtZcG2jK28HFgZSBK5kaw2YeWt1Lsl0mtqb4BHoLrDpTMQ0ffq
         JJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Svzt6/iLHU+CC2V5pTldKL48X2UmEGEzwqNRlDxdw4=;
        b=KW4co2o0BfKzaQIMdIpmBN8WXlhCyWFKvOPBcd9FTvqEQ7Z6vprFnPyTWCYaznU3bR
         FT5dfr1JUTkV5fxOo9ED/RKBN9AdXpc9zHM74STw/XEHCEMHWlynkLQ8oSnl6rhOsP7k
         /gU1JWC8H8rpb4AlvF2Y4tdIKD4h9ilWQXqVmrHKj45cBy4YSS4QGEMhkin5kNSN+J/a
         0Sc5cgtDCPHgLD7AoLk9pYRHtiNdiyNom6mpP5rXmC/UtGgtKoXQTAnfnPZYLFoN2xUT
         wiRdznUoNQYawOSiJs5CKF6R4ehmWzKDiaMLwKydTKf4A9D6x1es8/7DciFVeqE2ZzYX
         p8Eg==
X-Gm-Message-State: AO0yUKUiBSti5WPCMKgMcNC5PKpoxrtWa4Js985Q0WVsVy6e2rfC4P5V
	MUWi4MEVCfGQwPPKx7VRGXxVUA3xbGC0ktlc
X-Google-Smtp-Source: AK7set+xdxY0siW6D5hmOO9ZJn5gLSvFNmU43WxQNZUbVIAFT93end4ZG8rTAHvqp41C8KPHjeEEdA==
X-Received: by 2002:a05:6214:1c49:b0:56a:d94d:6deb with SMTP id if9-20020a0562141c4900b0056ad94d6debmr16998210qvb.25.1677083989925;
        Wed, 22 Feb 2023 08:39:49 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id 201-20020a3708d2000000b0073b27323c6dsm2704596qki.136.2023.02.22.08.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 08:39:49 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH 1/6] arm/trusted-firmware-m: Synchronize with 1.7.0 release
Date: Wed, 22 Feb 2023 11:37:32 -0500
Message-Id: <167708385325.3620198.5040235039694857620.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230222120441.2684534-1-peter.hoyes@arm.com>
References: <20230222120441.2684534-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Feb 2023 16:39:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4445

On Wed, 22 Feb 2023 12:04:36 +0000, Peter Hoyes wrote:
> Update the TF-M image signing scripts to use the TF-M 1.7.0 sources, so
> it is in sync with the TF-M recipe itself.
> 
> Synchronize the trusted-firmware-m and -scripts Python dependencies
> with the in-repo requirements.txt files. This requires a recipe to be
> carried for pyhsslms.
> 
> [...]

Applied, thanks!

[1/6] arm/trusted-firmware-m: Synchronize with 1.7.0 release
      commit: 1f6d2b269298e6174179b0a55be9d82d5cf65c1f
[2/6] arm/classes: Factor out image signing arguments in tfm_image_sign
      commit: 81aaae5754da4f904335f60cf8d14efb42de3668
[3/6] arm/trusted-firmware-m: Create common inc file for src definitions
      commit: de82f2269b7cb57105930dc05a4b711c8b4943d2
[4/6] arm/trusted-firmware-m: Create inc file for common config
      commit: 064a97e74598b5a7d7109cedec1aa8cdc8989869
[5/6] arm/trusted-firmware-m-scripts: Create inc file for common config
      commit: f474a0fee9cfca3207796e132afe5bf7e6d4390f
[6/6] arm/classes: Add sstate support to tfm_sign_images
      commit: 19767152e3bfb427a135f5366fc5b496341f121d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

