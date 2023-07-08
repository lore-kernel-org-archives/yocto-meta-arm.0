Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C874FEB64DA
	for <webhook@archiver.kernel.org>; Sat,  8 Jul 2023 14:58:20 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.19525.1688828290775730507
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 08 Jul 2023 07:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=KCCXCAR1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6348a8045a2so19351726d6.1
        for <meta-arm@lists.yoctoproject.org>; Sat, 08 Jul 2023 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1688828289; x=1691420289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDgrIQD1qea1dodyWu++CPWAiCpva4o3scbwahs/E0M=;
        b=KCCXCAR1HwkxcUNir2r7MP2bz/5DOw5h9l7caLakiGR8h7NU3oWpAjhTrsub0VG2It
         F9Pmu4iO//xoM4fAG/eveSQr/dLdDDmrx8Z8CUK+cu0hwSYTlDSNprU9eClwsGFGCO7r
         XRmFy+cw1eEN9kAWuFhBAyijb2rHCQ6GL6m/xbSeSEvvUAou4GfZzWMK2qYztpHbadQm
         fZfGz+p9AJiwfhLSFKnEd/UYpIvrv2NoDJKi/DIA37hrr2baT372xIwzRdKrHuZOiq3g
         Td50wbQeVcxkx9QT4mnCk/Te+rJ9SMPTgyDLT3I1Cgp64uwARYa623Ae6AujCM/22UWT
         DSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688828289; x=1691420289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDgrIQD1qea1dodyWu++CPWAiCpva4o3scbwahs/E0M=;
        b=GESiKsHjmBwwTa80GONFCVxb66SiaF4vbwKrYf+XqaGPEW7rBLLH09VPTk0wydSd1j
         MpDkmDOYBsrukdKdU2fuA5lvY8zZ8UMVUIkxCAaryGAQe6x8f3SPH7hAgDsN31/6gZ76
         QyIkIyjbX1uwD2VzRDyDUgnOQ//6KGRbVEOQYFdWTEL+LtLfXZ4dIuYlJ219cGh/t/Mh
         8k6Hr7EL1MZ1IXRU+/85gmwr5Cjr6TipI/phCeZUSPjt0Pze8cXqLezUDYhgtpbq6cns
         MG++P6TVOGIzrDxjdF4c2Skjsd5qJE8kXGg+gq0NOosHvigMWM8vDxaAjNtNjpDsahkp
         onyQ==
X-Gm-Message-State: ABy/qLbcMBfIRLjdxLPLZqn7kSNywgxkfTTveMG032TROLA+vIgw2pnC
	3LdVdqWpsHUPfbfHihFhgNVwJzZQ3q1PxknW3Q0=
X-Google-Smtp-Source: APBJJlEelC20jYCm25+zN+O+Z1NR3AownYzqeWquX43Mc+El52m8PkEyglJBsfU0KoU5VyuWtxK5PQ==
X-Received: by 2002:a0c:e247:0:b0:625:1c04:6761 with SMTP id x7-20020a0ce247000000b006251c046761mr7392607qvl.27.1688828289372;
        Sat, 08 Jul 2023 07:58:09 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id u21-20020ae9c015000000b00765acdc4f56sm2836976qkk.60.2023.07.08.07.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 07:58:08 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 1/2] CI: generate and use a Kas lock file
Date: Sat,  8 Jul 2023 10:57:07 -0400
Message-Id: <168882822811.4111682.604627612720761267.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230707134257.3059771-1-ross.burton@arm.com>
References: <20230707134257.3059771-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 08 Jul 2023 14:58:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4870


On Fri, 07 Jul 2023 14:42:56 +0100, ross.burton@arm.com wrote:
> In the update-repos job, generate a Kas lock file to pin the SHAs of the
> repositories being build during the build. This ensures that commits to
> the repositories _during_ the build doesn't cause differing builds. All
> of the kas calls use this lock file to ensure that their builds are
> identical.
> 
> This lockfile is also added to the artifacts, so that it can be reused
> afterwards to replicate the build: either as a known good base or to
> replicate failures.
> 
> [...]

Applied, thanks!

[1/2] CI: generate and use a Kas lock file
      commit: 271d848f6be58cfda56942770188bf3a455da799
[2/2] CI: add a tool to fetch a lockfile.yml for a specified build
      commit: 2d9a8f58ca8bf905a8e9e1792811dc65dcda4116

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

