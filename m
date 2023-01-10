Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DFDC46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 18:27:54 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.1082.1673375242603377832
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Jan 2023 10:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=DzAML86h;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id c7so11593686qtw.8
        for <meta-arm@lists.yoctoproject.org>; Tue, 10 Jan 2023 10:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+TZH6Yq5Fz4NuWi9VqyzNTq0hot+IViM3Eq1PbktlQ=;
        b=DzAML86hF4NaOuCAD9FExcFPuDSI2nF73eHS8iglCDFZqWxP58rRawzOqCGBwMKOXd
         GB2fD8PHqGYdCVuaWRqN+dC91Im/QLFgFYE6oH5dRxMPkCK5p/SQp+oS7Yqu54qllN73
         HtipfpK5v58l787qJziFeEOymptH8nKHX3kAsJXoLaMBvyk369XYMqh6fvlqeEp+GiqT
         1swdUBwT59eTDo04mVa+gCmhe8zhhMqDJNjJbbpZbRN2SGvN2zRs14D9v9KyXG7lzKzI
         B1rb0EOP/WFukY6PW7dBD25GOGayduZ01pNc0DYejYK8u8kU1hVn4LiXbuyypw3dzGUg
         GtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+TZH6Yq5Fz4NuWi9VqyzNTq0hot+IViM3Eq1PbktlQ=;
        b=pYk28EWf1anQ4t56bAK3fkIbhQGr+qwmvgDFZXWrsdaYtoPX7F4VH/GXm8METVkeiu
         KItr05nEIoWMrPGiI9pIk02FJFimJuiD9ouzd3ERnXocdAf2mL2olxuBff57nlykQSTM
         W6ThmzSz2nkDn+xeNiADMRyPWroM7xBArkgl5n8v8zBL4E2GtYwmKXcdcddo3hBqRXqe
         iCpBIOGIOTNhJPIzIOaWCg+Jf+sbxuqkmWSFpZsNVrVtCS3Cqh6+qIaexzC/6SnR9wS0
         MNSaywwADSWi+FRhoJpUhPs/fFTgSAWYtI28hxER3LgWD6ixLJceRbWU3cHr6hC+0raX
         iQiQ==
X-Gm-Message-State: AFqh2kr9nRi0RsCzaUpMPpOT+PxlvGQVsks2VOLRTtVGfodCivj8f+7t
	R8QtgGKcrSGKRCJyWWOJt0PrfbeUI3MkxyAV
X-Google-Smtp-Source: AMrXdXsqM45stv/j1mhppfT7a7s6mQV5csOz2bjlHSvQ6x0jHAy7fSYP7HcSTaB6u7c2FhH9d0axOQ==
X-Received: by 2002:ac8:68e:0:b0:3a7:ec99:56e4 with SMTP id f14-20020ac8068e000000b003a7ec9956e4mr5361020qth.39.1673375266774;
        Tue, 10 Jan 2023 10:27:46 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id x23-20020ac87ed7000000b0039467aadeb8sm6287826qtj.13.2023.01.10.10.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 10:27:46 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Jon.Mason@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/5] Add optee-os 3.19 recipe
Date: Tue, 10 Jan 2023 13:27:23 -0500
Message-Id: <167337524536.2415313.5013067025466169472.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221221143942.15196-1-emekcan.aras@arm.com>
References: <20221221143942.15196-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 Jan 2023 18:27:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4256

On Wed, 21 Dec 2022 14:39:37 +0000, emekcan.aras@arm.com wrote:
> This patchset adds optee 3.19 recipe and makes necessary configurations
> to support optee-os 3.19 on n1sdp.
> 
> Emekcan Aras (3):
>   arm/optee: support optee 3.19
>   arm-bsp/optee-os: Adds 3.19 bbappend
>   arm-bsp/optee-os: N1SDP support for optee-os 3.19
> 
> [...]

Applied, thanks!

[1/5] arm/optee: Move optee-3.18 patches
      commit: b061104c87ce58fcc1e9e4791a8339b7af583a09
[2/5] arm/optee: support optee 3.19
      commit: 3259a2a8402fac059e198b772ada01281d3f9cf2
[3/5] arm-bsp/optee-os: Adds 3.19 bbappend
      commit: 3d9c97a0cc9811f6f48004f8f1753651714699eb
[4/5] arm-bsp/optee-os: N1SDP support for optee-os 3.19
      commit: 529d18e8a5e64b28469c5b6312052bf3ce7c80a7
[5/5] arm/qemuarm-secureboot: pin optee-os version
      commit: a6211b606763255020e11bb7d838e3de647b3048

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

