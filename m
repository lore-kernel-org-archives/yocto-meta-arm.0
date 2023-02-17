Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0800BC64ED8
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 04:31:31 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.260.1676608283087204612
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 20:31:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=doHo/yMI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.43, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f43.google.com with SMTP id s17so2233498qvq.12
        for <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 20:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Df88j7zMTNM7BOgCnUVBAFsYSPyn/BzWEWsKQBfd+w=;
        b=doHo/yMIoVi0Ilwggy4h8yH/3fCzlipgH2GwcylR80hf9/CJ6ByoMjem/ByASSScle
         aOMR6R1tdTrFzbRQrLepXrG+UXAM2AeNmUtWd1bJZ69xvDdqZryBNsPczpBUPA1Ocxu/
         AxbOu1dizxP13XDK4UT8uRoCnEMPQ3DblQerFPuWQ0IutjyfzoWWHxSG0SoWQ18vdVRy
         42Bm4UhBelG40kmN+BTWUx58eDX4Zs0ITqqJlf54RP5x/p1xpnzyKeveQzefGJvGxFar
         rnuAyakN6nQP/6Gn/ADmt0aoPVlwDkZvWhNeLFR5/8SynsPoO/3aWSr7fSdBuT6XMwOV
         F25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Df88j7zMTNM7BOgCnUVBAFsYSPyn/BzWEWsKQBfd+w=;
        b=uA3Og2K038OpKFW+aL+bD2jvvf6hkt8UeeUexJLu22tkpnxLFz/t7GAxpZKe+tbAso
         0vxwObNZrl0YczuGSXfbZ/tADGMmx1BOMckGh6JlL4fsT/4ekXogOrHOuSa8Va7S4B2d
         fQkYoEKMvJe6+MQ5B14GK124/XQhBp9otD/B1ja6lHRdHJ2f1ueH9aVNx3G2GJIvluHq
         ZMUsoPQjV35jBj0B/jW/wklykqgs/qGKyWn+Z9VW1TCJKEmnYXFBvvIi73K81a8DwNWE
         m+hHhdjtcpWLbK5blbRNQct6hO0Cfk6Vw8m9nrUoA3yBO5AoRE67A5+H7EC9HTohhpMR
         bp0A==
X-Gm-Message-State: AO0yUKUb68VHxvJIMuLrkqZwJCPGKwHMtj8PKig8KAtna/iQ8uD9Ou6V
	dcKsp2750mrSmsLSPTOSEImQRybOFmT5Nmpw
X-Google-Smtp-Source: AK7set/39V/+EUHA84oMi0uCe/0d78jbYrs9RjEeUPpkhLWMeS+xZW4+0ETJ84JeH6Q6XZncGs9mvw==
X-Received: by 2002:a05:6214:2267:b0:56b:ee0d:e3b6 with SMTP id gs7-20020a056214226700b0056bee0de3b6mr8025438qvb.1.1676608281627;
        Thu, 16 Feb 2023 20:31:21 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id e16-20020a05620a015000b0073ba2c4ee2esm1564180qkn.96.2023.02.16.20.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 20:31:21 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH 1/2] CI: Factor out CACHE_DIR to improve mirror configurability
Date: Thu, 16 Feb 2023 23:30:54 -0500
Message-Id: <167660825903.685488.12641814158819675232.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230216162437.1232175-1-peter.hoyes@arm.com>
References: <20230216162437.1232175-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 Feb 2023 04:31:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4417

On Thu, 16 Feb 2023 16:24:36 +0000, Peter Hoyes wrote:
> Mirrors of meta-arm may have the persistent cache directory mounted in a
> different place. To make it easier to configure, define this location
> using a single $CACHE_DIR variable.

Applied, thanks!

[1/2] CI: Factor out CACHE_DIR to improve mirror configurability
      commit: ae3b2198879eed2c5a4646e372ef151ebf1f12e4
[2/2] CI: Collect testimage logs on failure
      commit: c5bf0354907b031b3ce3cdc3977cc4f70e28d00b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

