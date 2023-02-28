Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F3DC64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 14:29:49 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.24679.1677594580979869439
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 28 Feb 2023 06:29:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=frQgAyn6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id z6so10671040qtv.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 28 Feb 2023 06:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyVqgJqcrC0tXIF9ERA/a3yVjG9R0YCb2AGm5N5ZW6w=;
        b=frQgAyn6lF3PKqGOWdYCrGSTBQbcjkpSyMDHwskeDWGHAvtAT1t/a2lMHSkXmx4EFc
         dHFXQIc9ef2kUTtQa3rtPHVHJxpzOeLR9ZgqsKe0zhNWs5cyiuEezsFyazXD+X+wRVN2
         MmsKLeW5qtfSRwGFeSO+3waABDerkUJW/Z3h4VqQR/WIrbYcn4CQAGOaAxqqt4+mqgoU
         xbl9cbkIWiDwdCbyZnKIxyyxATOMWa11GedSAp2iFQnhNVbkxwO3lakt2DxX+NxhQJBG
         9lheDWQds+DRvk2J/OYtTLJu85MGm+B2K8zaxFtdEYqS1BqQJ+0QaE7neU/pWOn8ZHjR
         7GpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FyVqgJqcrC0tXIF9ERA/a3yVjG9R0YCb2AGm5N5ZW6w=;
        b=Bd/N8AZ4lq/6aGDm5TOr58PMbUKFujwj9u0Q0YUMsIqF5kALR620ta7e394myerJzn
         GezhDF/007NdUaIZdrK1ARnEiMPB9P3LwELtiNKfsb2GK8qPfk68wsGMGNhB+t2UfCmH
         qhwHz6HnegrklFpS6mvr2jpfCAvPV42cpQRpwdnc0AMZ+7YlOEM1ALKVPG4ab0dhymUh
         4YeOR+/BrnMCohQLDjR9+u6+mNBayQ6Da9u/EC6TQhuXgqhAFTTSg/YpEymqcp2OA5UK
         gdill2MCWRhgH639XaiKjPk1RqwtiuOaqNbPg829X8CbPh02ElkzXYbLt5MSJKv1cnvb
         yffw==
X-Gm-Message-State: AO0yUKWtCKlGr9koQWcqVcAX1TKqGnG1F7n771UDa/6Gi1pwokdehs2v
	eGfbQBG8hheqL00jIKWn+n4TPnHsH07BB7zD
X-Google-Smtp-Source: AK7set9vDpaS7a80aGcZd/tYCyOS3rE+Yue7VSMbRYLp5qIOaaiXaP37+IZ61+nCJCwhI/oL3bFwLQ==
X-Received: by 2002:a05:622a:1004:b0:3b8:6711:a472 with SMTP id d4-20020a05622a100400b003b86711a472mr5503322qte.20.1677594579583;
        Tue, 28 Feb 2023 06:29:39 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id s13-20020a05622a018d00b003bfa8e1b7d1sm6601231qtw.32.2023.02.28.06.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 06:29:39 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"gowtham.sureshkumar@arm.com" <gowtham.sureshkumar@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm/uefi_capsule: Move UEFI capsule to IMGDEPLOYDIR
Date: Tue, 28 Feb 2023 09:29:05 -0500
Message-Id: <167759454768.2250831.10358692363921803972.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230227165611.1337-1-gowtham.sureshkumar@arm.com>
References: <20230227165611.1337-1-gowtham.sureshkumar@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 28 Feb 2023 14:29:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4457

On Mon, 27 Feb 2023 16:56:10 +0000, gowtham.sureshkumar@arm.com wrote:
> The UEFI capsule generated is in the incorrect build directory.
> This patch copies it to IMGDEPLOYDIR.
> 
> Gowtham Suresh Kumar (1):
>   arm/uefi_capsule: Move UEFI capsule to IMGDEPLOYDIR
> 
>  meta-arm/classes/uefi_capsule.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> [...]

Applied, thanks!

[1/1] arm/uefi_capsule: Move UEFI capsule to IMGDEPLOYDIR
      commit: eb9c47a4e1897ee0d9d18834951f85ce4b4881fa

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

