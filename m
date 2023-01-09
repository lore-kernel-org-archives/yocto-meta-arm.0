Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CF8C5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 16:23:39 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.76552.1673281411749731068
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Jan 2023 08:23:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=Yl/5NVqB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.172, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f172.google.com with SMTP id v19so3132116ybv.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 09 Jan 2023 08:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+TZH6Yq5Fz4NuWi9VqyzNTq0hot+IViM3Eq1PbktlQ=;
        b=Yl/5NVqBIDeK6Cf6ZFeUNTbf66HC6famRIPkm0eD4mm2EqaWl+U9Du6R/+FXriQib9
         M+t2m7TwiEjdrv6ab9hke/R0W5RIj0OTj0gFD1pZbwqWa+cdPvSTwzLxnKm2LxGuD8ka
         Qv5DPldMiR7DKmhXeO9NrcR24MWPFHGRCR2VJm5WAZKmkMW85oXbwZPGAp3qVSKD2xMQ
         qvHLg/cFMqU4ebciQfAoSR5gwlxsImbrjUwgz6+ZPDxCfEafc4JmhZuDh304KM6cYsOg
         jxBp8u8I4glA0f6LrWTFswOpdPKI3r9bbVwttWLMOZ9QDGAMPd7Cg52o0H9UgvAyhleu
         hcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+TZH6Yq5Fz4NuWi9VqyzNTq0hot+IViM3Eq1PbktlQ=;
        b=Am4ZIGbTOjo6UgVaOAYk7OYby39SzLawQ5H7y77iDUL5+fJB0V+H3M9NADE+wSKDFK
         bcD0Nxtw4acq4qoaikqa65v4mvkET2owaw3fgx2herMz7FSt6lV6VMj+thfvpAn8mQmy
         VqhYP28Fue0Mpc8IfHIu9+7fkK0v0cFBraYMRAsGywp6peYM8CLRuVyDNOzRZKBAzY6A
         uNrJrb7n0k788Y1Kh7rwwIngx4l2XEIMh9iqkn63Tbx7cN/Rq/kt6yoF6oIBddpjrCIs
         Qsb2SbO33cDQTE869KPTyo6C/2VdTgOoXnft4EWRwDCU7EpE/gGwDRMfFryRbjVdEh6/
         +fvg==
X-Gm-Message-State: AFqh2kqfy4rEJDaEkJCBeXVuSDAOZbpSnU3MjfE17K82f5ca4NzvxR69
	h9Iqm8JuRCRFLVufGv6R0eLj8UK8ZZ4FbXAj
X-Google-Smtp-Source: AMrXdXvDxkqsnhiHDS9ZoEv19Iafvr2r6VRVG0Z6kKCSS3eSUWaMUOITXArcXboLNfVRSx4GHWg2LA==
X-Received: by 2002:a5b:f8c:0:b0:6cf:e72e:2d3 with SMTP id q12-20020a5b0f8c000000b006cfe72e02d3mr73903845ybh.44.1673281410441;
        Mon, 09 Jan 2023 08:23:30 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id d6-20020a37b406000000b007049f19c736sm5538656qkf.7.2023.01.09.08.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 08:23:29 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/5] Add optee-os 3.19 recipe
Date: Mon,  9 Jan 2023 11:23:06 -0500
Message-Id: <167328138753.3677955.13321819733500487813.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221221143942.15196-1-emekcan.aras@arm.com>
References: <20221221143942.15196-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 09 Jan 2023 16:23:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4242

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

