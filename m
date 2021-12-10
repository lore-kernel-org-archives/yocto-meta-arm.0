Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 174B4C433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 23:44:19 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web09.15082.1639179858134403323
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Dec 2021 15:44:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=einShCG6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id d2so9242830qki.12
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Dec 2021 15:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Q6019tQlgP7+MSMF1Kzq4DuPlAJyxqs+i5BuSyZ6Czw=;
        b=einShCG6K5Z6Hogz1nw4h2JzAJynoVBMWmYP1HDzYGO8oEWz/UNSJy/arxDVyUIaa8
         fMpSlOJThfajCXsKrHGRYnlULRhrGii7+t32lYzAbuiiVIHSST9SiTE9WwxSlJiKOCDX
         HvIPGsWAxYMPGK1bWVj1MG6v4565w1wv1vOFJgMbf3c77mmQj5JIPaVHixk3Zu/rdRfO
         soZHjtYvxKKoxA6gpYWiNTK8HoVccl7+YOWfwpyLyROCRNFK1ZGAxRgvhOXgRo6wx//W
         hwhZ1f7R7S54rMN6o1GE2mU/GSPhN6B3+XmPGpX17hhKgUOBLve5XaNizIz+xxk3Za2M
         6CYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q6019tQlgP7+MSMF1Kzq4DuPlAJyxqs+i5BuSyZ6Czw=;
        b=6zTwkHjr423lge+QGeW2cNwRiYRHo24KE13WyjmfJu23mH8oXxeL962Z1rDN14pmk4
         wQ7dtqW6XlV0ZDe78P/5zfYBkk+E4PQ5vl3lZDeSfUdDVRrQ6wXyojHWbCjSAs7euQDx
         /dflL59zySp4RHgsN/8+Ue5QIZS9c4HhQJACustIutorB9HfPHGZhl0wUxgjMVp3dfG6
         T7eDh6dtglUbQs35fxuUESfPQVEIr9t58n9VIxiy8m5kakCCrYzWoZXHZ8/G61HcGW++
         Xj+QUaiVK2aebDwEAOF+C2XvvFOKE1byz3Ri633O9t98bwqzn97q/lvGhzJroLUyYpCy
         0vCQ==
X-Gm-Message-State: AOAM530sNHhD9fujXYpuLVHFkDXwh+HaRb2wJNLMF/E1ASAolfI62s3m
	gUHStwpJAsr7Ph/a6cKzC+W9YgSGMqbIUQ==
X-Google-Smtp-Source: 
 ABdhPJw65Kox66HH5d/rsAZIZAu1EKTaUql19ipe2KdPBLC00MXja3AMkpV79GxjavfaoZyOP+px/Q==
X-Received: by 2002:a05:620a:2684:: with SMTP id
 c4mr23287953qkp.24.1639179857130;
        Fri, 10 Dec 2021 15:44:17 -0800 (PST)
Received: from localhost ([2605:a601:a626:6000:8d70:388b:b90b:fb51])
        by smtp.gmail.com with ESMTPSA id 8sm3255231qtz.28.2021.12.10.15.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 15:44:16 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] CI: update for new Kas include semantics
Date: Fri, 10 Dec 2021 18:44:09 -0500
Message-Id: <163917984948.12315.11317015694557933034.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211210152205.2699946-1-ross.burton@arm.com>
References: <20211210152205.2699946-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Dec 2021 23:44:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2616

On Fri, 10 Dec 2021 15:22:05 +0000, Ross Burton wrote:
> With Kas 2.6 included YAML files need to be relative to the repository,
> not the including file:
> 
> https://kas.readthedocs.io/en/latest/format-changelog.html#version-11
> 
> 

Applied, thanks!

[1/1] CI: update for new Kas include semantics
      commit: d446f7f80bf61e9cf05843e8ef4bc5473f936118

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

