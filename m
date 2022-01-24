Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C33C433F5
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 19:56:11 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web11.900.1643054170204162044
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 11:56:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=MLLBYW4D;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f169.google.com with SMTP id u5so14858708ilq.9
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 11:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8nEo5NByguUF3eAlEnMQkz9QorcHkdO/bqnqZKVmq7k=;
        b=MLLBYW4DiyfIIY+/GTZZ8JXnZU3l+XB5nU8ndC70et0xYg8qnHXaD0bLfSEudSIVZM
         HiPQY1L/+gYZ5yRrW3wXxQoSpP6+7NxGDV+dNgeNlqiZqysoB55CpiZrKJ7/Fpyqs8sd
         riz3a0lFnhSu8CUNZOJKsFJlVD+pfW3YeYAkqMNMIj1Jn1ZpgmyAhjIaRpD9jdwMHNxs
         e4aVUkaIP3e8XGpiyUlfS6xhaUw7u6bdtlJUznqfUaRh08qQ3IlkGEwyfyn9pG8k6Qsp
         AWauO6+/vGby3QvZcj7pwErBjI4nWwO/MPpf6v5lT6/knDppLsIiM04eJJjyFww62YVX
         pccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8nEo5NByguUF3eAlEnMQkz9QorcHkdO/bqnqZKVmq7k=;
        b=c910mliEAD5yD+3dWrUFkisxSDrovgqjMVcj1u0dbOGkXGEVw8Hzu1nuerrtDSpohc
         VgsHzXCdVb5NbK68dKElsUO/1Pn5bpEyqxgT+yARUdU/o8f+9voz3XpwFXNTyEhlJx9F
         4ynzPmMnpQcRR4pAn2m5SJ3dhWNg/9hkTfUOw+6xeguK1M1SvUegVBTOiVXRUKuX74Fp
         FdB5X2q8N8tWqcSJMhPyYM8xL/OvPCKmsqcU1HBoOSaDvvGQTL0K1eCQUW14QHhM2wvM
         qY16quZ7vDE/Mz/3KnB0hFRUCy4F9dkDWNuXDwQiX0R39DEEC1LXRRYKY7QilwYf+vuf
         yl6w==
X-Gm-Message-State: AOAM530cuXxtnW16QJd/19FpuvnniVodPlCfIS+M4D3Umbfiy7x66NME
	Y1o0XVnwdwRLSmQp2ZJBaB7qtHeS2Kd1BQ==
X-Google-Smtp-Source: 
 ABdhPJzYAmIVjlch5IwceJrubam63DIEtioTUcfNnkn8S705BQLm12fw5Iv8M5kFsMLCpypyZU8LZg==
X-Received: by 2002:a05:6e02:1c22:: with SMTP id
 m2mr5362892ilh.117.1643054169492;
        Mon, 24 Jan 2022 11:56:09 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:de27:316a:4e43:577b])
        by smtp.gmail.com with ESMTPSA id
 y5sm7034211iow.36.2022.01.24.11.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 11:56:09 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] CI: update for meta-zephyr changes
Date: Mon, 24 Jan 2022 14:53:51 -0500
Message-Id: <164305403724.317553.16960528115279151386.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124174012.3916927-1-ross.burton@arm.com>
References: <20220124174012.3916927-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 19:56:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2906

On Mon, 24 Jan 2022 17:40:11 +0000, Ross Burton wrote:
> As of meta-zephyr dde88ba the layer is structured different, split into
> meta-zephyr-core and meta-zephyr-bsp.
> 
> As we define our own machines for use with Zephyr, we can just use
> meta-zephyr-core.

Applied, thanks!

[1/2] CI: update for meta-zephyr changes
      commit: 710cf290b572ff75d577e587e9b6cfaa0917269f
[2/2] CI: fix check-layer indeterminism
      commit: d2c5a5d289bf89eb58fa565a0836d899df2bf8bc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

