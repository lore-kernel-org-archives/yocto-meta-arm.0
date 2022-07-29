Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F6CDC19F2A
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 19:16:34 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web09.1040.1659122189188192232
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 12:16:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=F6tFyzr4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id f14so4387495qkm.0
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 12:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=mucyUz72jwpG1xke3rP1hw2EOV7K7+5SaBfLA5Ck50I=;
        b=F6tFyzr49wVLG8Bifd8KAH2uKpWBgrDOAONjzL97+FABhyq3Dry1yOo3n2Mgff0QSS
         LXrYrNknFzt8KAdqFj00kUCMVrFMfTbF91QTX0bUJJ955J92515ooTcsla4oQ0kBVoo5
         6dChoDyJbj5HKW557U1QXRFYfCBfbveYvbI4WzPE6KL2nCJvIDAm85bocJ0qhyxCT437
         Esa1w5ZGE9DAxtwCRoXD4d9c0LE0fs/mh4On9QAuCS/qBcKC8CkHesyeYCqPLdbbvHsI
         MAOcR5JGyHMdTyBbVAXLiuMKlPM0RWLQuxCjSeB2zUXLLXgmxdsc7wHjIYnj61aW2rzN
         N6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=mucyUz72jwpG1xke3rP1hw2EOV7K7+5SaBfLA5Ck50I=;
        b=1XGgW/NBnrze3VrUyrPlgHSXVxzlRdLFRQfM7dJQ2hih+o3NYMf6JSXEJwjXyMFQSL
         5TiWeg50lrj+NQ+uxWFcRBm35wcnKMG0q4g8XC4rhoV54YhDy6U693uFVbMKCM5jhvPJ
         aIIp3bFX+anflR1/Eb9MHF0aWmjpVw6W6xXl2asZq9Z0wuRBECmiB68jmIYc2DZEr5K4
         1szn15k1THePtFNbxsKp1UDsdQZgIYAFFJBxgfAzBzjWO47RFr6k+fiTCfpjXsPkMoIp
         k7HDvf/xGHeSpKcKHWN3sXxvfsE0iS60lQ+Ok0HknR+ZGJeaQN6Rpvjg/GplWNn0/oas
         W10g==
X-Gm-Message-State: AJIora/Zj5lQ+KpwM5R6k9X3yuNuQFEN15x+5llnP6D94P2qGGAOUEqD
	XX82ya2o2UOF+IZRKpOPXiDP7P5KeLa5RA==
X-Google-Smtp-Source: 
 AGRyM1uS3D/f5ewZ13YhNnAhJVXjrrHNc/WOT0gsTkoqTa194owWTPW1bW6vMdSc1EYt67dyENj9cQ==
X-Received: by 2002:a05:620a:1b8d:b0:6b5:c56f:ec78 with SMTP id
 dv13-20020a05620a1b8d00b006b5c56fec78mr3897083qkb.362.1659122187706;
        Fri, 29 Jul 2022 12:16:27 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 q20-20020a05620a0d9400b006aee5df383csm136057qkl.134.2022.07.29.12.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 12:16:26 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"adam.johnston@arm.com" <adam.johnston@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/edk2-firmware: Add NT_FW_CONFIG to N1SDP (fix
 aborts)
Date: Fri, 29 Jul 2022 15:15:45 -0400
Message-Id: <165912214658.603519.14747540093228665691.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220719125325.923598-1-adam.johnston@arm.com>
References: <20220719125325.923598-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Jul 2022 19:16:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3617

On Tue, 19 Jul 2022 13:53:24 +0100, adam.johnston@arm.com wrote:
> This patch, from N1SDP 2022-R1, adds support to parse NT_FW_CONFIG to EDK2
> platform code for the N1SDP. This is required to fix aborts seen when testing
> virtual memory after enabling trusted boot.
> 
> NT_FW_CONFIG DTB contains platform information passed by TF-A boot stage.
> This information is used for virtual memory map generation during PEI phase
> and passed on to DXE phase as a HOB, where it is used in
> ConfigurationManagerDxe.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/edk2-firmware: Add NT_FW_CONFIG to N1SDP to fix aborts when accessing virtual memory
      commit: 2b392ebd3cf92cf1f62b53a13774649ca6be11dd

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

