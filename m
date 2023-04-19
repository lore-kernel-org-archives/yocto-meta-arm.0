Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146FBC77B73
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 23:39:43 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.54050.1681947581297811100
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Apr 2023 16:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=iH+l6YPL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-74d2597fdb2so4748385a.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 19 Apr 2023 16:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1681947580; x=1684539580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ez9gJylfHsPriba1KiIetIDJocWdrUdOFQl43I8KrLs=;
        b=iH+l6YPL2BVnawpO0evqAtW6ESVwIWToCTDiZOT1CxqDgAQmNR++sIabmEjditUzu9
         4M8OhSr843Au3BiMBG8qQ51KTB9OPBO99hm5KYbWD/U4WVl71xOhilUyHh1r5mWqMWy2
         mGtqLyKxnige1gyG28XpYxMMNgkMYQNdX3KMsXwWF0wtJdy765QsDOPpO8o0rQ6TdhzP
         5A8IU+skQ5q62TzqPwSdKaSsohDWYW6p1KGANzo/MKreBaW+oY4VJYoEkTSpbPzjgObr
         t38N6/dGgO95AgcJLFn+MUBDgXX1k/G/AbOrvi9x5Hul6OEKIsRYde4o1cToYN2umjDC
         QAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681947580; x=1684539580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ez9gJylfHsPriba1KiIetIDJocWdrUdOFQl43I8KrLs=;
        b=k9F/Lck0rwfkDF5qN9Hq6LdU07JQTz3fMKZcoX9c9QG4k4vfqTWrTKYgzQGXGX6YGy
         SHm+IQLWK3/4VQj5VagZAVsi+rMCJMU3f6FwY5f3OUKVPHUBphBdaBO4J1PGIoJOmpMt
         dzh7VnqnCuEuKq9qYffaRXfJEHEFNdrIKzP6MbPzjPHCbkTbmzPtRA8omZgzjtng4zaX
         P/90mauUifLF4sNmDfAWf6EIBxPyDFCGOD7UTukZD1L8+lwEgbJvIf7LyJlchqXBdQDE
         /aFhzz82UOyDq9lm7t3ORkRQNUB0VcHEd2PeDv4LhSSiJlulv5yMTTirMcgaAIBYRYLA
         gH+A==
X-Gm-Message-State: AAQBX9eEHJa7HzBNAU7MvvBM+b1O5DJ0JnBzOM/r/FNARXUow7IVbGVr
	+wv8x+9SO9nv8848usT0WMXGHy3VmpBWstvjPtA=
X-Google-Smtp-Source: AKy350YgjuYpy1JfK9rj/DJMsD7pq3gsmwnN3EQoZuhjEU2R4Duuo5AfIlfaXaBrBx6ctVQv2pnGPQ==
X-Received: by 2002:a05:6214:246f:b0:5f1:6a35:60be with SMTP id im15-20020a056214246f00b005f16a3560bemr621230qvb.23.1681947579905;
        Wed, 19 Apr 2023 16:39:39 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id g24-20020a05620a219800b0074db94ed42fsm3106770qka.116.2023.04.19.16.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 16:39:39 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/3] arm-bsp/trusted-firmware-m: Switch to TF-M BL1 and fix
Date: Wed, 19 Apr 2023 19:39:26 -0400
Message-Id: <168194756810.238245.15248036074138713150.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230419165422.15990-1-emekcan.aras@arm.com>
References: <20230419165422.15990-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Apr 2023 23:39:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4588

On Wed, 19 Apr 2023 17:54:19 +0100, emekcan.aras@arm.com wrote:
> Integrates TF-M BL1 into corstone1000 platform. This needs a large
> changeset since it changes how TF-M builds and packs the bl1 image.
> It also adds changes to make the new BL1 compatible with GPT parser
> changes. And finally it bumps to SHA to include necessary changes and fixes
> on TFM master and removes already upstreamed GPT patches. It also fixes few
> issues about applying out-of-tree patches for tfm external projects for
> Corstone1000.
> 
> [...]

Applied, thanks!

[1/3] arm-bsp/trusted-firmware-m: apply patches correctly from external repos
      commit: 323362f682f327ca83c94a34a3e53d1f2bdd85ac
[2/3] arm-bsp/trusted-firmware-m: Switch to TF-M BL1 in Corstone1000
      commit: 524203dc17fe6d2cb63e1a6b4abbcf4dda845acc
[3/3] arm-bsp/corstone1000: add OTP config for fvp
      commit: f54a9f37eb285f27d9823abb076b85000e45f9aa

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

