Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22055C3DA78
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 18:05:47 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.95592.1673633146317491061
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Jan 2023 10:05:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=ZPZgzgnM;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id s5so15232057qtx.6
        for <meta-arm@lists.yoctoproject.org>; Fri, 13 Jan 2023 10:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7Jv61epNUoBHkNYChgCLkAnLqhWcW7gJJI4QJHF8n8=;
        b=ZPZgzgnMWMaX/+gtavqP+uRSgwqnMp1lUJm2b1r52HVpy8/Ryd3Cu2DpxbHxD+ZvBB
         yXpmxYIlXcmeupPuuF77GIGQSy4t0hS/jgRv2QrCYpDgdnrCwzinvs6y5PZ4ZEkAM5Tg
         lhC04b3zaeHsRJplg1/ClzIxevjLdnCvK43Ke2f/PVLBv592B59Qj1fmmXvp8JV+C+LX
         KURsFz+CZ/rFDCiQFPPRQutLsJeQAiW8XaJeefja3RYucZ5r65Zg5Omfhsqp9YN2wTQL
         2iB0PcrA51bLqohtyhuOt1AdMMd/5huZSEEGrx9OHe/z8Mb4ZxzE13EC6gc1+mHLaw0O
         ph5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7Jv61epNUoBHkNYChgCLkAnLqhWcW7gJJI4QJHF8n8=;
        b=Me9YMB0MS/orWcdfodOcksN7mCoBZOWO6tdyJ8NwyHGt77GDC4ylubPIw59Oz84SIB
         d908j1fhjVoEjCZDK9p+WKD+LllPlqxvLroHzYyjmgjuY6/o0g3QtH8HlY2CKZeZBcOv
         GNqmUtgu3CuGC5QSAn3RChXOPzCFzvMyI3vkahN7/EqqvSh7CxF32u7Eu+ai8+tTQ15I
         iDLRHvq59BUtvIt+LQB4zjNpKf6SOSmgJJKlyVHqdz6x3qMvzKyKdSMPfwblnU+jGtgr
         AjbSPLqbaEVqbtaQHs9jnnzxLRWdT2bfj8L3umg0E8pt3SZcuT6zJpwrWgcFWenTAZW9
         aPxw==
X-Gm-Message-State: AFqh2kqZKIHGfuhWZtZ+DOdfsSNa9LcIb9fmrABZfdRCJ/gxbKf6bnJq
	S1QUcPhIQbvY7hRvtGC95wcuTz9N1Dvv7HKf
X-Google-Smtp-Source: AMrXdXtO2YaKBelE7FNfoucP9o7FmFBx4/yWw3Qet0GFic9jMgnEJSrRD3weGoxz+ogkrLrKedQEJQ==
X-Received: by 2002:ac8:6757:0:b0:3ac:aef8:bcaa with SMTP id n23-20020ac86757000000b003acaef8bcaamr21784314qtp.18.1673633144923;
        Fri, 13 Jan 2023 10:05:44 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id i18-20020ac84f52000000b003ae33f9260dsm6849354qtw.49.2023.01.13.10.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 10:05:44 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
	Diego.Sueiro@arm.com
Subject: Re: [PATCH][langdale] arm/classes: Ensure patch files are sorted in apply_local_src_patches
Date: Fri, 13 Jan 2023 13:05:30 -0500
Message-Id: <167363312981.997446.14737619002451771429.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230110133859.2230025-1-peter.hoyes@arm.com>
References: <20230110133859.2230025-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Jan 2023 18:05:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4283

On Tue, 10 Jan 2023 13:38:59 +0000, Peter Hoyes wrote:
> apply_local_src_patches.bbclass was added in a previous patch to handle
> the application of patch files located inside the fetched source code.
> 
> find is used to collect the patch files which does not guarantee the
> order of its output. Pipe the output of find into sort to ensure patch
> files are applied in the correct order.

Applied, thanks!

[1/1] arm/classes: Ensure patch files are sorted in apply_local_src_patches
      commit: 8b95c97a00c9b6dea4221726c0ef58c6c4a3175f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

