Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4550C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 12:46:53 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.20163.1718801208274979145
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jun 2024 05:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=SypGRHHb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.169, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-63bb0ff142cso707197b3.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jun 2024 05:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1718801207; x=1719406007; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4BoblI2StVPtzs5tCOKFoB3OF1wp/Vll3P1D3aTNyWU=;
        b=SypGRHHbpwHUZuv+j4SDrqyfkfWWaTCrTd7TDY2Zn3G5eH+/gvFLS19Wcx5Ta2i14D
         J24yIVu45/1+dzpf7e6T1h0TKnVAN8bYnXSR0UgB1/5eswnVt8eIzAUn8aXyl+zGrfrS
         fg5QXZLMOOPO6iHdn1vV4QLqEJP86Pjvhzm+G9AhtTDr4GMeOYHFysNBIhsLHLtd/IPo
         Wzj0yB9Pb1lwZRKCMpCpg2BjKtgzlclVMnQ0DizRNsQnLfpYOlykXEOI1UyNSbC+p7qa
         +1x4P9EIbVcsqXT5IlNQh/uT+/lCOjR1Rnb6iYx4+lHv1f09d248O2atT1vBLfC+Ej9J
         1sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718801207; x=1719406007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BoblI2StVPtzs5tCOKFoB3OF1wp/Vll3P1D3aTNyWU=;
        b=BepNz7OosL296YZZmgGHaIfQ05cjnaNenv0Vh3x8OMUGAX8rXIn7ygfcvblroEFv0M
         wHU8NxooEmrrfF3G5QAIaQmF34bOokDv1JWbl9Tf4jk/Nti29cXgP34TJqofWqbGoSNu
         +GDJoQctpih4lha2oIydoyRcoh9GALH35no1dawJv+uHKjjQXMcW9BcHU7CjofFFdJBJ
         gav0uHAKBG36N/L9NNQGfODNjKSBaL98m0dpNEC1Ug/nMdtYx+qm4CQL8UQPJZhbURpX
         FQ43JB2O6I8OVgrrSmfeCg7gG0KvAtuqVAjNehiAmqeWFkot4RhKlm/AjAcSRolnyxw0
         +hVg==
X-Gm-Message-State: AOJu0YwZea90JN/Uw+wmgEf1hMXsCviaOQxldF6Tg8ru0hy7QFjgrQor
	4p1IGu+5vPFkh1x8uBinsMQ8VG45kIcYWemCbx5zEI1BWr3gH3eUoh8CT++c4dxF3ZrZXKDu/wI
	=
X-Google-Smtp-Source: AGHT+IGLPuQDrsMCIaswTObywy180k2vuQJuxN6DvacabnLXyan+12dpCnYYAGmCBh43FMWrWXVfew==
X-Received: by 2002:a0d:d783:0:b0:62c:c696:56fd with SMTP id 00721157ae682-63a8f9fb928mr26209947b3.38.1718801207134;
        Wed, 19 Jun 2024 05:46:47 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6311af07f52sm21099187b3.134.2024.06.19.05.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 05:46:46 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] Docs: add ci/kas, quick start, and release information
Date: Wed, 19 Jun 2024 08:46:31 -0400
Message-Id: <171880119300.2085664.6581035349491551655.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240618134301.98815-1-jon.mason@arm.com>
References: <20240618134301.98815-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jun 2024 12:46:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5834


On Tue, 18 Jun 2024 09:43:01 -0400, Jon Mason wrote:
> 


Applied, thanks!

[1/1] Docs: add ci/kas, quick start, and release information
      commit: 150cd18d1536381838be97d50eda0e707f600932

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

