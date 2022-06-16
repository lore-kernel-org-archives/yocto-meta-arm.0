Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625EBC43334
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 15:35:54 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web12.19464.1655393748350549079
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jun 2022 08:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=bw+DiSw3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id 15so1251179qki.6
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jun 2022 08:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E7ieTDtTPILAlAUoeacAHW/aWjfvbEUcUqvp7RdAaBg=;
        b=bw+DiSw3ecyF8FXX10MgFqmbxndF5ezUXAnbcSdHSP28qc33vIw9EleUxCEzn9K0o4
         3Xcd0PXaxLOZ1uS4lPgZMCtbKtXm3Yqzdz1ZKWGq+v/asg7W4QgXkdwGav6Eio++qVm0
         VFUW8O1l/YU0iw7PSb8hJlbx3uInvrSoLutlbibJyqGw3XrbIvjtJYfkTt2wRHJT4GBf
         AAKE9vUBhaBk3hurT7LsYMuyueG7CpBT7uXisuxJlKF4dC7JZLGfummxZzl4fPIIarkA
         M9bQ4k3lONB0EtNv1N5tOR3XZmX6fAZGR5TfqLU4bVSuZhOL5N/KehZ3zmkEeN9pUsKY
         fINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E7ieTDtTPILAlAUoeacAHW/aWjfvbEUcUqvp7RdAaBg=;
        b=4wJMDVac4MX3EmXOhT2avehV60oRK/Phhu/9j9eOb0SSyxohlx02MxlO6L4x1lNQhA
         +QqtLG6Hxno4aFY843Be6MifTsSOSL8tWVFUAHGD38ewnqHrOxFrPq7SrQtA9G3GWq+B
         VrPEs1zJd0C6+b2VdD0BIVt4Dq+3jvmaqaZRzXWkSg5ZvkgME1tZ58yN5v2oXnIC6Cqr
         6tvpH6tNHVvyvWiIynjZDiR1KeS4QGQNDlTMyDMRfOP1Yp+EfwP6Lyly2aQyfVj2Q1S4
         6snnBqtcDPU9JDaf9rllbv/wpzjd6GQOToUZrsKRyfoH9uewX14ac0MNrt3ws9DjZ9pa
         dN3w==
X-Gm-Message-State: AJIora9Jvk5AjMqHKoh8LIs2bmCyjT0Q3XNuG9Wb6L3O+l+RDXiuaaEB
	1HYuElbIZvTiLu9beoHCl6LHdoMGJL00mw==
X-Google-Smtp-Source: 
 AGRyM1uEiKHjWn+NaV4JrzgMMNyYUgWfP8GQHEWGcKa+v7LTdRdk3i2gI6q8Hia9zIDNykwyYe9oKg==
X-Received: by 2002:a37:a14:0:b0:6a6:9192:97cf with SMTP id
 20-20020a370a14000000b006a6919297cfmr3886132qkk.170.1655393747214;
        Thu, 16 Jun 2022 08:35:47 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 e18-20020ac86712000000b00304defdb1b3sm1759316qtp.85.2022.06.16.08.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 08:35:46 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Diego Sueiro <diego.sueiro@arm.com>
Cc: Kamil Dziezyk <kamil.dziezyk@arm.com>,
	nd@arm.com
Subject: Re: [PATCH] arm/generic-arm64: Include generic-arm64-standard.scc
 into kernel config
Date: Thu, 16 Jun 2022 11:35:37 -0400
Message-Id: <165539373972.3162929.8620499463680724348.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <f3f1229b971b69cb0e1c72eaee5f7a8fdf893589.1655378917.git.diego.sueiro@arm.com>
References: 
 <f3f1229b971b69cb0e1c72eaee5f7a8fdf893589.1655378917.git.diego.sueiro@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Jun 2022 15:35:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3514

On Thu, 16 Jun 2022 12:29:38 +0100, Diego Sueiro wrote:
> To allow bitbake including the 'generic-arm64-standard.scc' into the kernel
> configuration, it has to be included as a kmeta type source to the SRC_URI.

Applied, thanks!

[1/1] arm/generic-arm64: Include generic-arm64-standard.scc into kernel config
      commit: eb0fa0526255f1e2b4cb9955e47791f711bd4d31

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

