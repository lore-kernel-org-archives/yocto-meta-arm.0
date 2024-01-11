Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD3DC47077
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 19:42:16 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.1942.1705002127973370313
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jan 2024 11:42:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=QdXwbXV3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-429c9c4c572so2405031cf.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 Jan 2024 11:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1705002126; x=1705606926; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6Qdau5z579TUy42CA2YuqNPtDgAtPgzNL69oj3WJSQ=;
        b=QdXwbXV3GulUe5P3qy4/cMDJg65oWBrDw8yUqN3FLtO7TKMomBmkQcos86Zpf4vqSV
         ISJl+9hlpHhW71ryCXichO3awVsAdZNglyTNIUjVFf2AzwzCeBO0tQzb49Vs+30OLLWp
         o5igXrebtvHhgk/eR+ulowpAFOa+casTwN2DZ3HHmDum//ztai6gpX/NCCXw8Aby0q54
         nql8aDg4jhMaLmgiAXlzwg7qEE1HTQcU1+1Cz55kkwkBQVZN5DmoAIj7uxzmW25IZ8Ml
         skXMx2Unw4dUcPCphwIInIXLcKlfXV1H/NdvR24v/AUw7vOhlVnbeRTsMcuQY+eQ4GqQ
         ApyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705002126; x=1705606926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A6Qdau5z579TUy42CA2YuqNPtDgAtPgzNL69oj3WJSQ=;
        b=MgI1bwOlvNykj2Tz/mGbqXPLUv06MJJbT0Cqj+BKM7nN2TE6Dw3uJvfnsQR1qnIbpe
         ztGXhuJ1nkus5fuAqUsmCiEBVYXKha+YiQ+CuR+WatUqnolbw+h4pAC2JrhWMHhWbtoG
         RmFopiaeB8ZhoE7mwxTQBcVCCHxekfbp1q+vUeSJKinGfmmcWd4K0OVGFOHx0X2mK4du
         uwXa7kbe40hQDFxRS7bCPJxubTu2nSTvAuSSaCYqDP53hmGkDTMMI+rTKbMLutZ/k4BX
         xGD7KEcQIpM8WGYGfA7ATej2jVHkHKnVpeED9dj/UtrIDSjr6lZn2TsS5RVUFHJub3Nj
         I2zg==
X-Gm-Message-State: AOJu0YwG4gpdV+5KsCJpBcrfo0hr8JYvP4tjkwgB+pLF0XNtHLD+xlQg
	BKUW6mdF27QyMHcthBhzus1ELDOOXECI7nRIfaaQ+TIcig==
X-Google-Smtp-Source: AGHT+IGz4s6wB9FoSJhU87UXkHW3RLAI1k9V74RfK80SJz9qyIsU419oTFJ6V9tl7IGemnGZLACsHg==
X-Received: by 2002:ac8:598a:0:b0:428:3306:ddf5 with SMTP id e10-20020ac8598a000000b004283306ddf5mr275169qte.59.1705002126011;
        Thu, 11 Jan 2024 11:42:06 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id fw6-20020a05622a4a8600b00427f89957d9sm682033qtb.79.2024.01.11.11.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 11:42:05 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/u-boot: rebase patches for v2024.01
Date: Thu, 11 Jan 2024 14:38:54 -0500
Message-Id: <170500193545.527185.11114061764300492733.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240111150823.3576-1-jon.mason@arm.com>
References: <20240111150823.3576-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Jan 2024 19:42:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5330


On Thu, 11 Jan 2024 10:08:23 -0500, Jon Mason wrote:
> Rebase the fvp-base and juno patches for v2024.01.  One patch was
> upstreamed and thus dropped.
> 
> 

Applied, thanks!

[1/1] arm-bsp/u-boot: rebase patches for v2024.01
      commit: 57124220111285bc6e731985f46da16bb1d20339

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

