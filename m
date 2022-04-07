Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBA1C352AA
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web08.2132.1649355748276892113
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 11:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=3Lna/AL9;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id t7so8728862qta.10
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 11:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uEfMxqKhShwKNle0uWxh9ZnkkvKht6/0Q41BXLa144Y=;
        b=3Lna/AL9tXEg0cAv9M4fQq9Sg7WNKVtLVjnxHxVeXgYlXtT8pbJMnxOHDI8fKFskLh
         4MSUeOM3IIMaCBLLWOFN2SlIpGv8+QONSVxPecIfcRAuhu774sunzHU/0kiOVN8TOHai
         3FxgMQF8Ow3AZRIBFmvbIRWXYmfTAFv9mGAxDom3YUnkD5J7HsC3kw1O1GSxSY/cER+J
         tZ6ol2PuXG4g2j0rgjnvF4p/LHZd7fNg9lfhMo8i770BmPX0FR0dPzB0Kec+tpZ1K/Eg
         8nxekn4n6P781PY6uFFFYV65rdM96IbtzyKB6SGIlATPpfITyhWhnJGfBGBuWa26+UQm
         RFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uEfMxqKhShwKNle0uWxh9ZnkkvKht6/0Q41BXLa144Y=;
        b=GUMjGnFcfVHTUk0vMw0MkFVdlHGXqUaFihJB5IwMSu8J6C00liO8/ncK5lowYmky0M
         XG40zpoCSgwf4ygFDGfRhKue8S9doZYC3Eg00DgurbFRwQD+XMdbHvkNqq49lTxcSVsp
         t2ECQogUzZf4ONGEVPAdzA5znN/fqRZV3SvLyxSSxJUbVZWvl9WZ3cFzh02YFJSXkD5v
         rdWHY27ShsRJ8Sp/bqf59XLdLRV3paYJmZRBv/FyynxqnSj7HYIVXBmMMkkV4tffstq/
         cGI+P3+m0EcAzT+IQYD9F+MTfBAMIVvjmu0ST1S0mrUgIAKyUW6Iske3P7YRKx7yMqKG
         Eusg==
X-Gm-Message-State: AOAM530fm80k1mwYlqfKuxjZ/p0tCyTawmqyhaDqAcvlVL4hom+ydTZC
	b+9BwMbqVgZbKjOVbMBtc3wKew/UAYPmMg==
X-Google-Smtp-Source: 
 ABdhPJyRkdyqzaFAuMWEWoyhxV+tuKZpHaRX2XDuOei8xMZyCyFqYiBhyc8Ne/XWDybTrDOVtgM13Q==
X-Received: by 2002:ac8:5d92:0:b0:2e1:ed10:569a with SMTP id
 d18-20020ac85d92000000b002e1ed10569amr13133830qtx.418.1649355747290;
        Thu, 07 Apr 2022 11:22:27 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 c65-20020a37b344000000b00699aa260f5dsm11048045qkf.1.2022.04.07.11.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 11:22:27 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
	diego.sueiro@arm.com
Subject: Re: [PATCH] arm-bsp/linux-yocto: Enable virtio-rng for
 fvp-baser-aemv8r64
Date: Thu,  7 Apr 2022 14:22:15 -0400
Message-Id: <164935573606.148594.10907298322407712161.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406170915.304097-1-peter.hoyes@arm.com>
References: <20220406170915.304097-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3262

On Wed, 6 Apr 2022 18:09:15 +0100, Peter Hoyes wrote:
> A virtio-rng is available from FVP_BaseR_AEMv8R version 11.17, so add
> to the device tree and enable the correpsonding FVP configuration flag.
> 
> This improves the boot time and removes the following warning in the
> boot log:
> 
>     random: udevd: uninitialized urandom read (16 bytes read)

Applied, thanks!

[1/1] arm-bsp/linux-yocto: Enable virtio-rng for fvp-baser-aemv8r64
      commit: 4c2f4ab95e3aee2c12d9dcb6fc4171acb42cd1d3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

