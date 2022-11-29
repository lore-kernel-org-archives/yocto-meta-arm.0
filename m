Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BE4C43217
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 01:14:53 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.137184.1669684488805892163
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Nov 2022 17:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=Ixh90/YO;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id v8so8705159qkg.12
        for <meta-arm@lists.yoctoproject.org>; Mon, 28 Nov 2022 17:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpWqUQxxF+XHPQxXC9RRIIs2w2lVgGpAQWS7Fox8K6M=;
        b=Ixh90/YOc+ayDrluESD9I4dLrNL3E6qag8mto1gPNQKofDpoNnAGHyYfaiBZi6Xqvj
         VYNEDUWLGAorQCNidCrFTSsxqU0sA7L1Kjs8EWvXIEpS81B2n5SqEuATzmqrbbd/NKA0
         rUTvg+oLR+po0vlZJ8Tzk/FAEL0UnEzeNz4XDPqKs8euXgqJXq1gria33AieR0MFHkmc
         psnsCY12nX2Vur8BxEoY/7MhLiuLZqRd+hEWas5ibXnvPYwJn6Q36HHOUUTK9ipaPDwc
         RDEQgqPYidFBr5PVBCJf6yHDJzyggBysJrFcubsZfaU0VKoLJSDbp/v0TvDt5VEPFZf8
         dSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpWqUQxxF+XHPQxXC9RRIIs2w2lVgGpAQWS7Fox8K6M=;
        b=RHCqq7VaQvk935NcmQQPmiNjMasAnCnUOipBxN2rqxeNHK5YLWtX9M5Mycq0HyXsGk
         arAMuIDrG/O+Vwl3IaQCSAXl6IEtyJlsJQAp1SMDBb4uQTph77sop89GRZsy0vveHjiN
         tzCu7Rk5eV8cWOpYP52NoqNHEtsRswCvfHpfueXQeIeBGya+HEk0dhHcjrTdcMmD8FbS
         1iNPRmKJbx4YmBsDT1IhkN9H5QETYvY65zojmm/VU2sQdJo9llUHGoUPs7EHpfTrOBNm
         86xwNJrND02+w3EUx6jV0TeevoR0BhTXjYLhtezZcyoOKDd+CW91b1hBrqL9Zat+eduD
         upRQ==
X-Gm-Message-State: ANoB5pla4Qc7KJZ3UoXasF2CJkmubwsweucDpyvBDjRV2cpkhug9kmmw
	ytsNCjQD9d7o/t/zGAi13kElHta3KjaWbQ==
X-Google-Smtp-Source: AA0mqf5kV5DpWYbTLhsF4t1lNttxyZFoDg1Th/e9ZOX4p6Z2/FoluxhDvjm+6nGD43ykIw5N4Al2/w==
X-Received: by 2002:a05:620a:229b:b0:6fc:8f4e:5e5e with SMTP id o27-20020a05620a229b00b006fc8f4e5e5emr22028qkh.480.1669684487475;
        Mon, 28 Nov 2022 17:14:47 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000:24f9:d5b6:38a7:110])
        by smtp.gmail.com with ESMTPSA id z27-20020ac87cbb000000b00359961365f1sm7758985qtv.68.2022.11.28.17.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 17:14:47 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH langdale] kas/corstone500.yml: pin repos to langdale
Date: Mon, 28 Nov 2022 20:14:33 -0500
Message-Id: <166968447319.1339510.14435734173646072279.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221128121927.3949299-1-rui.silva@linaro.org>
References: <20221128121927.3949299-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 29 Nov 2022 01:14:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4171

On Mon, 28 Nov 2022 12:19:27 +0000, Rui Miguel Silva wrote:
> Pin repos by default to langdale release branches.

Applied, thanks!

[1/1] kas/corstone500.yml: pin repos to langdale
      commit: df7ac03ac8995d38fdb8fb4f6e8f8671e6553522

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

