Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA31CE8369
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 16:25:02 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.59481.1727713492705219737
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Sep 2024 09:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=1DPSYzWQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.172, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e235a61bcbso25877447b3.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 09:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727713492; x=1728318292; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+jvmzGPf7avxIcTkLMKOpSYTFqE0jGQWZebKpIIzdqs=;
        b=1DPSYzWQBPpPyHFmEbAibyjfp5Mo1C3QnVAzhbms0CdDoVZ09eW6GPMFmS7/JgoIt2
         ot2vxtYKefo4foFdhELzfjGGFjmWH69GwkaOB0tN+dwlPa40Vmq3521hYnsghG5wczL6
         rtNeqMM/lvw1lW6sUBxpdt8DwQammC6Z+5Gl6AVdmKS2iEIel3C7VHaQC90+kBjjhY4K
         8z19tj4r4KvxTK1PEJfMc3ZcKMvRtu+SAvFq3ivELk3ulyhANKNawIMe+Dcd4TeWBY27
         T+ML34XgTpzMDC1F+5nTIs5oLeWKcM7sJWhl2mUkCPmLTW4bRi+3ojQcHPW/Fm80G1qX
         KPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727713492; x=1728318292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+jvmzGPf7avxIcTkLMKOpSYTFqE0jGQWZebKpIIzdqs=;
        b=mdQ/QetBOt4eXgQAXH3NdMwPqTFrTTTUnrgtcs5+KS5NMPfPqUbYoB97QA3ONhTKje
         Gk1+NwzOL08s7Her2VR4eGCUAkhzsXI9JLJmEtWtMRYSKEDfHl841CuvUaCe6HTpBeGQ
         256LuCIueIv4l4VF0wibb4Pf+Z8kpRQYHj9wuSxtu1E50N65y4eQk5pjuPy8TmtsHIZF
         b14svIP0jREMkg0J7pPL/nU0Josq8e8cLF90uvPsoBikLQVifEK22Y73q8TESh/ThTbA
         aSdnnKSUwhGSYEtSdH/qJLbyzsvvxADCUUBgR6CitsDUsLqnA8YdMCJicuUWimurJzy7
         w5CA==
X-Gm-Message-State: AOJu0YxoWvhtEQ2M4rsjZI2AemAUatgg0WIfm2nxCrkZmv+5ZmOzzCxC
	rSDyy1YOBSdN3JC8FPGhJjWq1UmesFd51YHHmtoQvtne8bjDFTGw1aUyNFLk1l0TZ4+nqYoXN6M
	=
X-Google-Smtp-Source: AGHT+IGpCdk4HdqRW3mbNd0WHC9bBjbTaeHcoituKVymzjUrpQsn56Je/gVL+khdBPZ1EZFYNzoSWA==
X-Received: by 2002:a05:690c:3512:b0:6dd:b8ff:c29c with SMTP id 00721157ae682-6e290e4edd1mr1797767b3.17.1727713491554;
        Mon, 30 Sep 2024 09:24:51 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e245317bb1sm14391807b3.62.2024.09.30.09.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 09:24:51 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	bence.balogh@arm.com
Subject: Re: [PATCH] arm-bsp/trusted-firmware-m: corstone1000: Update metadata handling
Date: Mon, 30 Sep 2024 12:24:31 -0400
Message-Id: <172771348141.724488.10873360513842099484.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240926214130.270088-1-bence.balogh@arm.com>
References: <20240926214130.270088-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 16:25:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6141


On Thu, 26 Sep 2024 23:41:30 +0200, bence.balogh@arm.com wrote:
> The added TF-M patches:
> - Remove unused files from TF-M's BL1
> - Remove unecessary duplications in metadata write functions
> - Fix compiler switches in metadata handling functions: the runtime TF-M
>   uses the GPT to get the offsets for the metadata.
> - Validate both metadata replica in the beginning by checking the crc32
>   checksum. If one of the replicas is corrupted then update it using the
>   other replica.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/trusted-firmware-m: corstone1000: Update metadata handling
      commit: 3db8bc67b4a42d8c1b196b7a62f9dfa55c40ea07

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

