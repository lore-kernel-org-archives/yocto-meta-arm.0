Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBC8C6379F
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 04:31:21 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.260.1676608277540722560
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 20:31:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=vbIrXqGY;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id z5so4351240qtn.8
        for <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 20:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOhXpHRHl6pMbcJRuJaGRHFAbz2RnvmgRC29L+pkgqg=;
        b=vbIrXqGYXnFLSHa8iCrOvHaDdu4q78NGd70SePcX42RVYQ81k9EDt5tJa42gSauBAb
         RUXfUGZGz8/+jV9hGNdXUZ7lWfjFmG5o4r4ZGxmq8jKJLZO8hZ/iffQHqVEPOg8RZ5G0
         zp35MYIIstnzQPkCDiXAJ0/VG9+1arAmBdA/BGTQEvjto6gooMHXE/Et600xIBVQZWZ7
         BqjAbwegli1tOY2HZAZ22dSgpC2RmgpoAlzKkme8eO/cRN25H4b5azm+889uKo0Ha5xp
         SXtxW5ePLt2Tyefkm5dsOpAVqTm9VQN3dVxN2Phh8nm2NFHgBDrmb3dayYVoVfdtYScP
         U9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOhXpHRHl6pMbcJRuJaGRHFAbz2RnvmgRC29L+pkgqg=;
        b=pLNb4yIYBPEkidehJxsRAj353rbooG19UPjivIXyLAlkGSz3CNiW+fQzKJ5KDw9KTU
         HZw5NSUBn6+BQM8F/3Jug6aJazFzvuwnnIZB5Z6LW2lXImSwre3WxgptpcjaaiH/NmBo
         MX+n3zlHe+dw7HpM7FEzDG/rhYwxYwyD4yh9TuWHoxszd5NH08pQnD5GjPrW/W1PqdZ+
         TRnQwsjMBvBfzi2gqagr5uTyxcev0Xq/66y/CW4MEZiBkEff+SDkzZmePaU7C8GzLduY
         BDppnt1/1EAJqmr15UMiw4FdhXWH5WAsYzisVnG4HiV9Hj6qUvqGshD9yovQGZ+msDfo
         fqXQ==
X-Gm-Message-State: AO0yUKV4f/AXqjFQIQmvY7eUBwaypmAWmYLhADSYq/yW/qsHVJoSqyJJ
	M8d3qK7VdQP/8VwzSJys+SotJJ9T8zO2wgPk
X-Google-Smtp-Source: AK7set8i2QfJP4QyG7A+dgNaFwM2qj2oRzRW/kXpmsrNn1uHuDT11iq/OuBq092LSwDX7N8Zm7B2EQ==
X-Received: by 2002:a05:622a:188c:b0:3ab:2a7f:83e4 with SMTP id v12-20020a05622a188c00b003ab2a7f83e4mr12669602qtc.35.1676608276232;
        Thu, 16 Feb 2023 20:31:16 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id d127-20020ae9ef85000000b0073ba92629e1sm665017qkg.23.2023.02.16.20.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 20:31:15 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"gowtham.sureshkumar@arm.com" <gowtham.sureshkumar@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] Update UEFI capsule generation to use json config file
Date: Thu, 16 Feb 2023 23:30:50 -0500
Message-Id: <167660825902.685488.13846065059795271240.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230215104236.24484-1-gowtham.sureshkumar@arm.com>
References: <20230215104236.24484-1-gowtham.sureshkumar@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 Feb 2023 04:31:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4413

On Wed, 15 Feb 2023 10:42:34 +0000, gowtham.sureshkumar@arm.com wrote:
> The UEFI capsule parameters can be passed to the script using a json file
> which is easily scalable when generating multiple capsules. Also the edk2
> base tools recipe is made native only.
> 
> Gowtham Suresh Kumar (2):
>   arm/edk2-basetools: Convert edk2 basetools recipes to native only
>   arm-bsp/uefi_capsule: Use json file to pass capsule config
> 
> [...]

Applied, thanks!

[1/2] arm/edk2-basetools: Convert edk2 basetools recipes to native only
      commit: ae0dd2a58cf612b30d7d18d86bfdb0930432f44f
[2/2] arm-bsp/uefi_capsule: Use json file to pass capsule config
      commit: ac39c6d4cc9390e002c7be6cd7080214c144349a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

