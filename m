Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC82C4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 16:17:50 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web12.7710.1668442667965131872
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Nov 2022 08:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=G2/zsPGo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id o8so8050476qvw.5
        for <meta-arm@lists.yoctoproject.org>; Mon, 14 Nov 2022 08:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kP6C9AF4unpzZDvDpej1DmKX3UB6w9Tf9r4ZED9EBQI=;
        b=G2/zsPGoqfsMsOe4Y6I/eRFAKCZqhk8dGxvG+Td1yIaQAmJyhYr6Fy3FNk6RXSGAGM
         7i4XI6ZbT2pXw9teGEk5WN5coh5BJeqCqe6+VM7wzDN50KOksQD8l4xBVBmmYbhq5i5s
         y6bEcAKkVJT5x07YWjppOQdr8OkkUkR3r2nzCYx8Lu/lYHbeVMbv4iUrq6o1kHJUT6s7
         8PDfi6SXF2q7UFVCck2cWTofUs1FE6RNshDeyee+rmzsv7SN9G95XbFzyFV56iIHNswm
         bt0OKcnLVTo6z+3mZCU2PKxgw2LymbMqNnRKMtTc/ZiT19wO0aCbf9nCJi7qi3IHq7E9
         yTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kP6C9AF4unpzZDvDpej1DmKX3UB6w9Tf9r4ZED9EBQI=;
        b=XL/P6kkizXAZJEJs5FzUiD1trt7cQh5Z1AhTPAAM37AhrZAZtCDYcNWhC1kt2rzRSs
         9GjeTR54hROz7u5GQySgelyBXPSHX/PqllsVepGsm7t5szyHmfWROG1h9c0tYjlkxVS0
         zchiOp6uIhCnD/qCfMnPt1hAEAqtYIeiOj6kVl0lAIQoGs/is9ySheAcNjonpVzwHvSO
         4TzQqhXedRw52pBFeFz2fGWbtZZ+ZmacNvGuH0oxjYgNlmakzMfSZGiY0kOsakVDNhjC
         R78zFZiCdIPgLdK7580cQjFHHddh4//6rCnlaQp8U6jFsAl0zVhwRrfG46JcUiomIlNU
         HhwQ==
X-Gm-Message-State: ANoB5pnfbjrhxe10PDtZO2DaBqRGkHzXInrTWp45+0rUuv6TivT8gaYm
	284oWAOvIWOrwluQZJ8lPeXjws817ckXjQ==
X-Google-Smtp-Source: AA0mqf7AkQQXHbTk9+s5OgH2RsgXqsbXdqMJLv1a6llFMmO2g/8hgq487+vCrs7k9GBZIPwGOce+lA==
X-Received: by 2002:a0c:c347:0:b0:4c6:dce:fe12 with SMTP id j7-20020a0cc347000000b004c60dcefe12mr13217758qvi.122.1668442666589;
        Mon, 14 Nov 2022 08:17:46 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000:24f9:d5b6:38a7:110])
        by smtp.gmail.com with ESMTPSA id u6-20020a05620a454600b006fa2e06aec6sm6628280qkp.52.2022.11.14.08.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 08:17:46 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH][kirkstone] arm-bsp/linux-yocto: refresh juno-dts-mhu-doorbell.patch for 5.15.72
Date: Mon, 14 Nov 2022 11:17:38 -0500
Message-Id: <166844265819.53258.11283172170019228754.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221114140145.190556-1-ross.burton@arm.com>
References: <20221114140145.190556-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 14 Nov 2022 16:17:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4124

On Mon, 14 Nov 2022 14:01:45 +0000, Ross Burton wrote:
> The linux-yocto recipe in oe-core upgraded to 5.15.72, so rebase the
> doorbell patches to apply correctly.

Applied, thanks!

[1/1] arm-bsp/linux-yocto: refresh juno-dts-mhu-doorbell.patch for 5.15.72
      commit: 67578fcfcd8ee8efcaef67ed7db1dfd55105872e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

