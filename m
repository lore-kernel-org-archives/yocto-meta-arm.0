Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F072C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 13:32:25 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web09.9200.1648042344226147786
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 06:32:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=bMENE63r;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id ke15so1160787qvb.11
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 06:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yn1U4mMHFAVskr0R9WgqzohlT+kLP8/0XQcLNaFlIyE=;
        b=bMENE63rH3dDYEV42anxXbYw02RM7SafT4FY6GVj9ZtbO+gGxIDtBgqzI+ky7dKtRQ
         ux+ScGqVI4eQC15XEF5eCthIr2TbNtQqVHdcuvQSklD8IFaywgghQRxq+XY20sdKDBeZ
         om4clLaBn2aTj3Fdw/TXZwHiObrayshEc+gRr0gHQj9pvdEe+HfcVBPToG2zAegFqpXB
         DGlA2HRiiltYpuvrErktLUMhOK61pIPVp4OW2DZCypjV9ADyz3yhZ+ikGI8UhoCU0H1+
         ju5gpDS9Sg+6/d1vF/rCNkM8o89KlH+QbBR0Z4l4zI4fvr/81p59b+ROYJ2T5FB9TouL
         RsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yn1U4mMHFAVskr0R9WgqzohlT+kLP8/0XQcLNaFlIyE=;
        b=u7K+MzfnpriSQeMn2EgShgRCmMIvdLtS01ILom1qcZo9XxHb1aIIJZn0j3WowV+Mu9
         4DsRVNClRTi1dbTTjBCPss0HQlmwC97XfZshNO0yPH9NhYrIZlsIVBIBpK+qpOTJkUnt
         rVuLHZ+EBXCgpgo1Rjf2RjwbyxFY/TQxxr2DuILNd8DTgcR/ArGoqc63Y4DspGpxUG5J
         jdnrmHQCUXbOhgE/LHvXG2xpDAg2SqO4YqXvV1/goyj18pmQ3sjyQU9fJQIrjyH7CQ/r
         Oshs2etMIAb1LPS5kdyrNRB6Rb76T9741ZkiiQ+zn+zSBST9Yw3OlEO5rhvJUBQUfnXT
         1LLw==
X-Gm-Message-State: AOAM530vy35zBMnavhANxZGof0uQgch6VvwVh8n+gnWWRCbqrzgRt6lC
	7eaPkKLDcZf8Nx4zSqYpGcDndDN8oOpXew==
X-Google-Smtp-Source: 
 ABdhPJwFiOH89e1ev61+d4nGMv+VdCKfykcR3Spxvb58XOZHWYRCBKkYz9il8VpXPsUzDugUBbdU4w==
X-Received: by 2002:a05:6214:c26:b0:441:6696:c806 with SMTP id
 a6-20020a0562140c2600b004416696c806mr231805qvd.43.1648042343204;
        Wed, 23 Mar 2022 06:32:23 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 22-20020ac85756000000b002e1cabad999sm20344qtx.89.2022.03.23.06.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 06:32:22 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm-bsp/scp-firmware: correctly set version in TC append
Date: Wed, 23 Mar 2022 09:31:21 -0400
Message-Id: <164804228335.3978431.12962332160260244865.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220318111147.417622-1-ross.burton@arm.com>
References: <20220318111147.417622-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Mar 2022 13:32:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3202

On Fri, 18 Mar 2022 11:11:47 +0000, Ross Burton wrote:
> Set PV to 2.9.0+git instead of 2.9+git so the version comparisons are
> reliable.

Applied, thanks!

[1/1] arm-bsp/scp-firmware: correctly set version in TC append
      commit: 15e3e0daf62781776ff318e5b9aca9232c40798f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

