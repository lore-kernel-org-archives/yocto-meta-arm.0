Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD560C43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 17:15:36 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.457.1656004530441286362
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 10:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=TrgdefST;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.54,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f54.google.com with SMTP id g18so365646qvn.2
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 10:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7E4q8l8xZGujICLgFIzymeEUr8N/5ZTojev5lDvFrGY=;
        b=TrgdefSTAs4Iywvyx4QctllhSIpITgyOH/pIaWWx+2SwU5JqjCBCd9HEW/b9LTFAGv
         vnRqZWbuktWSWVP6zhp24tfOpRXJuVnP8kD379ikMFzC5Z+ZGZwPPHa4Kx1sADsSrrru
         0gmBJHZqwhetJvrhmITKldusSroqMozLN7rzi+Z3WyMM/5N5OSk/EY6cgJK4ovzxiTz1
         qlmflH2G5zn2hPmjISmhamLoaxi7JUZOw+40uyCq/WmH3YUiHYFyq/FdovcId9Ch5sCu
         aaWGnkqwEzl9GNDagfuk7Sjm7onzmkRdP/0fcg26OXqTTPLixtLYAphccvPKc4DxOkB/
         VpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7E4q8l8xZGujICLgFIzymeEUr8N/5ZTojev5lDvFrGY=;
        b=Fq4Y0Cq/wJ4ULGniM9Ol5jCX+C+EDCp3JfxlHTj5Wl61uS9EAdxtBERKnixz4+STEI
         2EFcLXsLVZ9W+jMKwOKoKN5NXjqOQfV2pZeol3OPFOWEN7yKCGqFcX34otweyTShrJlh
         f3/0FNkCwynfNqvSClQv4xFHdMIrQpVHnmM5Ad7IQBKfGtr+jaW3JT+fEMSM260B2Lhs
         /NESYk4be21w1xnV+2xmG6bSwYsGa1UMaW71cVI9e/Y7eFtMppTAG+p52nuzohqlePUi
         WmRJ0/2UuJ0sJZgCgItaFyFNpIx110UEt4i2zv8wR183zDQSG/aehR9hrPUe5thoIUBH
         3+sA==
X-Gm-Message-State: AJIora8ysyeIy0P2Xvc4vSkO71ni4CXxzPbWoR1VFg51eNYqTyL6K+V8
	1ktqNO0mDeo8oG/xqEKi8C+R/NmvTNH7Pg==
X-Google-Smtp-Source: 
 AGRyM1tSZjV5P8a4hg+j6yS0SywLoGTWw4fZTXhkhdsYJ25oTARfYPxZ7qwZwkCTdGwtGSA8n3eRVw==
X-Received: by 2002:a05:622a:1884:b0:304:f534:cfe5 with SMTP id
 v4-20020a05622a188400b00304f534cfe5mr9140543qtc.544.1656004529198;
        Thu, 23 Jun 2022 10:15:29 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 f11-20020a05620a408b00b006a9901130b2sm57506qko.86.2022.06.23.10.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 10:15:28 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Leo Yan <leo.yan@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jerome Forissier <jerome.forissier@linaro.org>
Subject: Re: [PATCH v2] optee-ftpm: Update to "main" branch
Date: Thu, 23 Jun 2022 13:15:26 -0400
Message-Id: <165600452595.3412483.1717133633458528746.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623120814.214530-1-leo.yan@linaro.org>
References: <20220623120814.214530-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Jun 2022 17:15:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3537

On Thu, 23 Jun 2022 20:08:14 +0800, Leo Yan wrote:
> Since the github repository doesn't contain a "master" branch but has the
> "main" branch now, this patch updates to the "main" branch so can
> download the repository successfully.

Applied, thanks!

[1/1] optee-ftpm: Update to "main" branch
      commit: 6ef5382ffee3de7f65510d04290dc8e8f69701d4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

