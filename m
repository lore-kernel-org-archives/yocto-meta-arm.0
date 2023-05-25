Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AECC7EE23
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 00:51:55 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.1798.1684975907906234925
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 May 2023 17:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=kzkbVPoZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-75b14216386so24615285a.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 24 May 2023 17:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1684975906; x=1687567906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1uclevA+PO/pBmkgmkH+Rw1aNP6BxHCg5WQ3boRineQ=;
        b=kzkbVPoZJX5GfrNCz2yqPjkzBTCtInwkXSGHLPLtBBverugWnT7FI6buSKJvoWFSju
         ozKO17kCjfVMO22eUb0Yvg4LHk437Fr1VmI9b6LZeEWSzIqJr9DqNotR7As7ODWgefbk
         /53Q9tEulHtZ+v/y1RqC4MRc+dKARuygnTLKzEXEemF30PLEuUrrXxGafQU0MenBE+HM
         6mTzH+NoD5fw8HsNt1nnWk6zSABWQcYTwiqcr9NGaYuidH0pebTCSoWyp6ZsHc79AWjH
         lTuyGVdla6m1qKZGG/NH3fJP3ywLX5QWQPZqQt6GIrTp4vl8cRU9iuErF9Vd0HGuqd9X
         QrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684975906; x=1687567906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uclevA+PO/pBmkgmkH+Rw1aNP6BxHCg5WQ3boRineQ=;
        b=ETm7c+NnPBsdhCklLYrav6iLz2jwLtYMyynJtU9CIHF/Xiw6k+W0bDxeCtm0q/YWYp
         +UWJ/EUGN59vsz6y2adm5U4/gGs786UT44C4OjCLmUHAlPZ+ISMSnIZ6SLHiOLsvnGgZ
         SGclREZUhwY7YN1sEO2OV8y+58aWbDPsif1gbipzaT2cqhKuYKS1LKEw0JDuoCOZipwV
         oGT1V7VmRjqI02eTHJ9njtxsa1wVzgldorpVsjzGhvfTSf7zPvPZxaDP++vkAbCbyWnL
         hOu/Ja9jBIonEDU5qKYYAnkOEFdvvpyQMLQkVvRfRl/xKTTnTjk7eElOplFsNmdznyi9
         57Ew==
X-Gm-Message-State: AC+VfDz976vsULGF3FGXQIcemych820X78EpEVwbgWv/u04Jgb5HaAIK
	jPKASRIFn0kr36j2OamHEUOVVkDQlybgeV9c6PY=
X-Google-Smtp-Source: ACHHUZ4Zon2ZKcum7cjwAXARvj6i595REIwvSSphy+KUqh8YSQlcO5jyy8d5Ff7k1twMVPlunCa8WA==
X-Received: by 2002:a37:a941:0:b0:75b:23a0:e7a9 with SMTP id s62-20020a37a941000000b0075b23a0e7a9mr8711844qke.10.1684975906559;
        Wed, 24 May 2023 17:51:46 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id o19-20020a05620a111300b0074df51a90b6sm10600qkk.60.2023.05.24.17.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 17:51:45 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 2/2] arm-bsp/tc1: re-enable signed kernel image
Date: Wed, 24 May 2023 20:51:33 -0400
Message-Id: <168497589903.1985833.12642568359907867333.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230524160237.3275001-2-jon.mason@arm.com>
References: <20230524160237.3275001-1-jon.mason@arm.com> <20230524160237.3275001-2-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 00:51:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4694

On Wed, 24 May 2023 11:02:37 -0500, Jon Mason wrote:
> 


Applied, thanks!

[2/2] arm-bsp/tc1: re-enable signed kernel image
      commit: 5cbe3041befbf4cd588e8f45a793448833cc3f64

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

