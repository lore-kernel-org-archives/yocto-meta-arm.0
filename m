Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E97CDB47E
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 02:31:07 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web10.18959.1697682661939236786
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Oct 2023 19:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=0B5kGKEy;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.217.41, mailfrom: jdmason@kudzu.us)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-457e5dec94dso1821752137.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 18 Oct 2023 19:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1697682660; x=1698287460; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlDAskp7GuaRjPK247ZTW6TwDAY4NkebI0QzRdKOrmM=;
        b=0B5kGKEygaNQ/peshrLstTTu/0e4y2UM+L/02xKxXcc7WA+g8SF1URcpblmwwUDXHH
         zxV9GIWJWffyOJAwa7ibR8U8PydW+StbYPbkLtrtVPbpuJndedfSSpxfK7HVkgHuTNyA
         8NjVHYgtF7HdaBRPzQ/XQBENIv/E6c7fKlh67SjAUcQ8x+SdjIziAxTzxo6RU7LD3wDg
         lbZ4rCxfeHJXTIAjdCnjvRDwjJtaknGkREdcSqYe84XL4600FHawTwPAiNcU5ADcy98a
         6Jpljw28tDvqpLXtuP6rmMRTp4pV02/g+nZW0+B1bA2qBInOtt0ra2v71IMjrO2FrPVz
         cM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697682660; x=1698287460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RlDAskp7GuaRjPK247ZTW6TwDAY4NkebI0QzRdKOrmM=;
        b=pAr+ln8zOClXDenXUsuoQ1rJgekqLeCapl78teoIlQ+KrotgXikZrZ2/7//Ibbhj7i
         5V0HJTjjRF6h+q2RnIp7Ca2nhAI0h1NcPrnlLTzmZxSPcPES+n3AlnGW7JbQKgxAiuZG
         HIlIVybxPOrpGWQTVt/k5EMqvaJaUpjn1j9+uK1RFsJ8XjBhS8OP15KDIOX9QUL1UiWq
         0tYpaKOqAV3FAu9uVH5fHl+EFk8sWPBPejtxuqIiMFEVYm0YRFAK9ja/B9kxAim48Zr9
         1F1wY4KDsRj2VhGVWNUjq6nDNxOlWtFuXx61nrR6P29hCQh9EiVoy9pku2SovQVcxAAJ
         icCA==
X-Gm-Message-State: AOJu0Yxh8nDN8PJEBvhdhpCP2qsBmeg/mHEcPQIZEiUD55IngTRYv099
	OfbHiWtV21BWKfWDMXsUsQ8YblfE9Sv42qWZEI0=
X-Google-Smtp-Source: AGHT+IEGmjscxYcLtnGfreMaCIIdxwt2GW+Vab2AslHPsdrylyWsI9sPyzxzJahXZG7hn8uxOYz6ZQ==
X-Received: by 2002:a67:c18e:0:b0:457:dbe3:ef45 with SMTP id h14-20020a67c18e000000b00457dbe3ef45mr877131vsj.19.1697682660550;
        Wed, 18 Oct 2023 19:31:00 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id w11-20020a0562140b2b00b0066cf09f5ba9sm435449qvj.131.2023.10.18.19.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 19:30:59 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	drew.reed@arm.com
Cc: nd@arm.com,
	Drew Reed <Drew.Reed@arm.com>
Subject: Re: [PATCH 0/2] Enable TFTF test build for additional boards
Date: Wed, 18 Oct 2023 17:27:57 -0400
Message-Id: <169766448032.3620860.16723552268122204502.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231018142409.5807-1-drew.reed@arm.com>
References: <20231018142409.5807-1-drew.reed@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 19 Oct 2023 02:31:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5146


On Wed, 18 Oct 2023 15:24:07 +0100, drew.reed@arm.com wrote:
> From: Drew Reed <Drew.Reed@arm.com>
> 
> Enable building an image with the TF-A TFTF tests in place of the TF-A
> BL31 payload so the tests are run from normal world on the N1SDP
> platform.
> Include in the CI configuration the building of this new image for the
> N1SDP board
> Include the building of a Corstone-1000 MPS3 board TFTF test image into
> the CI pipeline
> 
> [...]

Applied, thanks!

[1/2] arm-bsp: Enable TF-A test building for the N1SDP
      commit: 8b3df3dd9bcf380bd7a0c96581ce5d3e48b3a52b
[2/2] CI: Enable TF-A TFTF test builds
      commit: ba17def14a27ebe0bf024e1981e90e24f3757e41

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

