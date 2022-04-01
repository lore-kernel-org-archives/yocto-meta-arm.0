Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D73C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 00:53:37 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web08.5166.1648774416265804678
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 31 Mar 2022 17:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=up2gXtxC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id k7so926037qvc.4
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 31 Mar 2022 17:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jPt/WPH3a+fTXYbqayAz1jWCwPT/pOSgDEPcBJxGyvc=;
        b=up2gXtxC1VxMAc4NXjd7OwRifhURQNQmSI5j2c7ylVhC1QNEY7mkrOZ5ydrjZ/YUHZ
         WlNse8QwHlIZesr2QTpzRJw/je2+79vbrmu1sNyOT3tEk+Vowo4Jv9U0Kz5iuQP8IBV2
         U/uSdzOlOBhUYzsZtDj4hlUCFJl5ff8yQCQnHI/b3R4HNrVTg4M+Ick69pGXg0LUSyhF
         OIGbSZzqfsqHFvz4D3bXBQxvwwaDcbOexmtsftlVfAZOtQ887DJ3s2mSzL+wQTrGLt+y
         lNbqR2TgPFNj5Fns4gjQS4abZHL/MSAI78GJg1IQJbgpTpAMH3EgMkWB9bX/sHRJETpV
         ndtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jPt/WPH3a+fTXYbqayAz1jWCwPT/pOSgDEPcBJxGyvc=;
        b=yHypafWUzd5n9s7Pdtp9npwo/Vw25KS3A4ip7eXgqPuIxCqE36aJK/8IJ3AVdP2c/k
         ArDjcfVb9mtYoUhhm2l4jqZEG8IsMj3kmfya36dXxm66ZNo1oaprp75o0QNdIMdDOf5F
         dQjNDZ2RLy+iAy+AqiBcnNnBja9vx7UGq0IlRDyuU4UZ6WLgclIrK3Xlmud1SQCfneIR
         Y7tYY98plT9amjpsEtMgM++pb4FSPLO6bBjPjCmWvCtJaMMqW+cuHzgrah9E3yIJAO50
         igKZ6/2i7vgxrORbuzVW/UrpHay72MwNwifRM0l6fYIIxLcFhlrCuFPZNIRCyJ0upBZw
         FZfQ==
X-Gm-Message-State: AOAM531iZMB3WIKmrvYR1ZngNhexzW91gnMIwTjCiAGHYTEJQ5Jnm+OY
	LUqv0QtP+6TNwYbLFilSQyxTMbpd4x3sNA==
X-Google-Smtp-Source: 
 ABdhPJzEQs1SWL6as6NcwB5cmoM7gR0PPveqOP/K7XZfG0fSYTcq1Xyges1j9a3YzMam4Rx7H7V8zw==
X-Received: by 2002:ad4:4d44:0:b0:440:f857:c9d with SMTP id
 m4-20020ad44d44000000b00440f8570c9dmr6463260qvm.81.1648774415214;
        Thu, 31 Mar 2022 17:53:35 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 g21-20020ac85815000000b002e06e2623a7sm739431qtg.0.2022.03.31.17.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 17:53:34 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/7] runfvp: propagate the exit code correctly
Date: Thu, 31 Mar 2022 20:53:28 -0400
Message-Id: <164877440837.2477312.9980763629604209498.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220331183117.22389-1-ross.burton@arm.com>
References: <20220331183117.22389-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 01 Apr 2022 00:53:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3224

On Thu, 31 Mar 2022 19:31:11 +0100, Ross Burton wrote:
> runfvp could encounter an error but the exit code remained as 0.

Applied, thanks!

[1/7] runfvp: propagate the exit code correctly
      commit: 1a7c48e5f6cfe916e6e7d1b1076f4f9aa3230a19
[2/7] runfvp: check for telnet
      commit: 58f3251598a618cc16fc186102a1783efed660ab
[3/7] runfvp: strip all suffixes from the image when calculating .fvpconf name
      commit: 3a0dbcd37fbfc74b528ab47c78d50080f301f61d
[4/7] arm/oeqa: add basic runfvp test cases
      commit: 2b5cc5da3ea1f8898cb29c60ee6b2fd67bc437a4
[5/7] CI: clean up assignments in base.yml
      commit: ba7803e5138ae0295362b16c93eab5e3ec0cb6bd
[6/7] CI: add basic selftest job
      commit: 5289c05289335d1786d0c70f12a335281f04fd86
[7/7] arm/oeqa: add no-op runtime test
      commit: e4cc4d01cac2d4c1e8b798de42a1644bc869078a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

