Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78906C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 20:06:46 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.1710.1655237201868846082
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 13:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=1HH+2pEG;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id 68so7233803qkk.9
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 13:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SKiLxzf6mCrzLi+kEPUa0wwOjWnJcAVhKbe6RReHBCg=;
        b=1HH+2pEG6TIPiDvvTBKdhB/EPndwNsaJ3Z908x7/io771JvpCJNbZ/+PcIFxh6YU6w
         qqhRK5vuywzfFYPWJGjR22HEFTqunrP5+1AxClxyhyEojF/bfb6Cil/gaq/Ke731gsys
         1LB42KXAu3hNxngFbVULUqDszVxaHhlfqpKdKy1sUh0HhIRTgaCOq9ViM4YHg5LUNfSQ
         e7Lidfj3w7c3RBxkCK6q+8UAm4he9EkVtoabPPUNoJDNxuhPvuIkKRnQK37bwdLz5C4Z
         pSLLQuIpO0dofDLWHORMnqg92Tpvd3mBqYDQhuTgwl+1xOt4NSfmvs6ylVMd8mCgdxNE
         La3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SKiLxzf6mCrzLi+kEPUa0wwOjWnJcAVhKbe6RReHBCg=;
        b=ph5vPU39XK2p8kQ1TwJKO7J/Zf093G4YVpS2S1CE5EknUF5vtee0uj/QZ3oazzL7Lo
         kPZncewiB6bVPwA1qSXkabXhfZ7jaRfyc+1Cgc/GDv8vYgs8zUm1KFwwIfueOWcIGN0C
         n5IxxGlziOPAfk5un1Tj7Z2cLNTIz49xhzBd1cYcR7+QRVviWU5KonKYpGNH0AExgAod
         Mo2CqS8dgdoJW81Ap66DO3775SzxLdij/QPthve7bJw/sjxR0yCRH1oLK68C8+v0LZXO
         PNmbwabPs9yCnZzJro+UnppsTpjJvMe4YUo2iN/3J+9GmubWZK52UvGa4NHvnoKBYyt7
         +xlw==
X-Gm-Message-State: AOAM531HudZ1YyeNBZ+VUG3uR8XXfB6W4aPBkhlIlMi+JT0N1zd3OdlR
	AVZz2iIaejVEAzcBXubDWt+TndDOTpxkxA==
X-Google-Smtp-Source: 
 ABdhPJwa8owvB7zY0fgGmRAyJtnvI95gks0CIB3ZZyEpQlf8nAtwInTDlPzuorhoLHfBFWNqtXeNeA==
X-Received: by 2002:ae9:eb49:0:b0:6a6:a1a7:eeb6 with SMTP id
 b70-20020ae9eb49000000b006a6a1a7eeb6mr5423975qkg.31.1655237200644;
        Tue, 14 Jun 2022 13:06:40 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 j9-20020ae9c209000000b006a377a015d4sm9959995qkg.39.2022.06.14.13.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 13:06:40 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/6] arm-bsp/juno: Update to u-boot v2022.04
Date: Tue, 14 Jun 2022 16:06:33 -0400
Message-Id: <165523719573.643054.7852974424136318109.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614171514.32495-1-jon.mason@arm.com>
References: <20220614171514.32495-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 20:06:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3498

On Tue, 14 Jun 2022 13:15:09 -0400, Jon Mason wrote:
> 


Applied, thanks!

[1/6] arm-bsp/juno: Update to u-boot v2022.04
      commit: 170f0b43ba36483ad59735a2f0c26402251f629b
[2/6] arm-bsp/tc: Update to u-boot v2022.04
      commit: 55feeb942e991e9af2c8f756d68f6b7535a51bb6
[3/6] arm-bsp/corestone1000: Update to u-boot v2022.04
      commit: a2ff119a6c50ca7a6fa6eae13c967026a51cce17
[4/6] arm-bsp/fvp-base: get v2022.04 u-boot working
      commit: 84f7dd6243395f6fc045ff34682fdbc2f5188482
[5/6] arm-bsp/fvp-base-arm32: rebase for u-boot 2022.04
      commit: 9722278593802b5dec98c07168c9d1fc647d5d63
[6/6] arm-bsp: Remove old, unused u-boot recipes
      commit: 7aa3997684276fe467e51aa6c065a5437d5deba5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

