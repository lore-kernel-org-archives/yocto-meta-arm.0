Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12989C3DA78
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 18:06:17 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.95517.1673633166950981842
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Jan 2023 10:06:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=ebzNzQ6F;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.177, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-4db05a4db9bso72973997b3.10
        for <meta-arm@lists.yoctoproject.org>; Fri, 13 Jan 2023 10:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwYc6GLNIkmYfgoYLvPpf0nlwPFQ4Mez+7DQNMOLr5Y=;
        b=ebzNzQ6FJXcSsS4SQHoSBYrh37LaDMbVc1vPyUcb6jT0UAOtZdstVbOhP5z8r/bbHh
         bbEfbETm6vflJ8C093IWxc6lt0/iL//yOmEoPs1heYEfKFXb6clryP/DsVzqYFaZbb8v
         jP+RIEZy8T7pYaPhbRrDBO1LuYF1RcltK1xEqTA/AeUcJcNHzPcnabhdMR/BD77NXrqk
         8nvBk72uhq+2y3IaBMmKANhPy8MpXw4pVxbX8B9qwlV8lJPQ9zlYwgd76vTjWfDiFovy
         zwd0tKxSeAKYmSqLLYMetBjisCy9nYmm/iUuFqNiKr3chH5V+ScSl62CVnTroHrZwEVj
         yyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CwYc6GLNIkmYfgoYLvPpf0nlwPFQ4Mez+7DQNMOLr5Y=;
        b=Cqbp2iLito944+Vx9N7VP6+E1giVR9QeQ0891EuL/dJNSIzIW6ruEJPjeeY5GpEQ/F
         R1m/A4wZoXBibPb7msYAcnsjgsMWJKP+kNEz6Zx5cOR749ybxXsPaCoF/Hm4SS59S/9w
         0IcgAshzCr0lMuQUH6KFVefKQZfquY9P8G9YmTWPsyBjZVSEMpiNbHcd0C2kaVpqqHdd
         BS74yU12RYVeXuvrwr30CidipNJZPWtxKSeIlq452qTp3HKuzorTGToLjGVsWyI7/Uhp
         u4OlFCKi2bCUonPFh4Susm+o+63jMVdB2hhRHvcLG2UyhnC769sBcyBPZtET4X/PxSpZ
         t5Ng==
X-Gm-Message-State: AFqh2krx4R3GrT//O75NH+P4p88fny0K0M5lxb9SCXEgTENA2PFXERLX
	z8sVtFTubTLvEbwr6nPbWLFdysTkOxE6vRmC
X-Google-Smtp-Source: AMrXdXvXy7CaXCqWtK550kDBm01PPyiI4VVw2Y01cNkMCB998eIh2vqtlUMMy9/x8wZEyCOZAN48Ug==
X-Received: by 2002:a05:7500:6618:b0:ef:f08d:4bc6 with SMTP id ix24-20020a057500661800b000eff08d4bc6mr982281gab.39.1673633165593;
        Fri, 13 Jan 2023 10:06:05 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id d136-20020ae9ef8e000000b006ef1a8f1b81sm12923769qkg.5.2023.01.13.10.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 10:06:05 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/4] arm/fvp-envelope: name the FVP tarballs for checksums
Date: Fri, 13 Jan 2023 13:05:47 -0500
Message-Id: <167363314944.1009004.1602774508768466104.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230109172022.2280271-1-ross.burton@arm.com>
References: <20230109172022.2280271-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Jan 2023 18:06:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4286

On Mon, 9 Jan 2023 17:20:19 +0000, Ross Burton wrote:
> We can download both x86-64 and aarch64 binaries, so ensure the SRC_URI
> entry is named to identify them.

Applied, thanks!

[1/4] arm/fvp-envelope: name the FVP tarballs for checksums
      commit: 8015efe2f1b23c90277f2995cdd2700c6cfb11dd
[2/4] arm/fvp-envelope: update HOMEPAGE
      commit: befd9f1567b105c5f3173ddb7d668fc73b923840
[3/4] arm/fvp-base-a-aem: add support for aarch64 binaries
      commit: 0c4bfbe40aeaee89d09f9a076c5b650bf2166e8e
[4/4] CI: don't pin fvp-base jobs to x86-64
      commit: ddc67dc4bb254ff2adad4266ffbf73aa8008adf5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

