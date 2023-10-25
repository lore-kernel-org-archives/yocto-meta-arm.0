Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5777EC07545
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 01:34:14 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.164610.1698197646190167807
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 18:34:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=TJhCv0DX;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-66d134a019cso35223386d6.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 24 Oct 2023 18:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1698197645; x=1698802445; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXfYUxRiD/PzCVjLLsJm3elkxo8E3MB+i7FdsFjwLGg=;
        b=TJhCv0DXzAru2r2MV6maK8hFFhRyzf5AinYcqu5a3JqQYcMccGgtHNTmjP4nc5G7DB
         9KFP41B3dLS/Qcsq1sFGbgsH0PatkIbiVhgoewD9fVVOmbAw5QqmYTDazXtPBYkxC0AI
         ++b/ZPTgFwiJBnnGVLuF633gmhmnQ4CFMncPecjbFj1EPhUE1FW/M5tjk2oBDPTYpiiR
         IvBRnDs08dT1vTkkLkb+ZNrfkuWbQNnqFqU84kxmuqUXb4AZbmKcWOxZVBuw2NvGnWrr
         ZqwVRCMp0Fu5ckWtE96tl6/9oD8mLqeuIuLEGDm67rSavgil++KzFlDDuD3+OMw7LI/n
         5vPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698197645; x=1698802445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXfYUxRiD/PzCVjLLsJm3elkxo8E3MB+i7FdsFjwLGg=;
        b=OxoDXcZMcWVEAcIaJ2OldBh9UPyw1urqpUDkgetNxnmuSRkXg/f4YzPi9fUlr4k8l7
         3ceECwca0//USkXq5c3yOR+Vr/eiHj4d5zVSkrQZ1YYmPDe+1mHo0WuLnUTygkrNw5Pf
         484m7XdmbSwmuEA7JK/vYdsXnlSM8N0JjQC8D7CaMT89h24Z1WUBsZhgPNG6203V1Nlj
         BPm+djpCR/g3yBjC/BQXQamwEqYQl9ZgqagHhtx+H9Cr+uONpAuoFSI6i8fSDS3Cd2pJ
         RQfb3yPhb+raNgoHBmZeAgQeNqzuYdzLbbEVI8gmlDrTtHGSFO781a+rg3zzlxvyjmgW
         AQTA==
X-Gm-Message-State: AOJu0YyCOvNZqq4rTKFQHJsfZiz3eNltgHUZLzcE9sDcwVMIUkRnS8O/
	a29jIsK9r+npQiWnMcdXonHiWktqJrfwxZky8QI=
X-Google-Smtp-Source: AGHT+IF1HADXsV5gh8ABWanQPAjEcc891E28xXWj6EuSr21+FQ+5qpjpAKQWR2t6acmdHEnhbXiBlQ==
X-Received: by 2002:a05:6214:2a4a:b0:66d:a309:275d with SMTP id jf10-20020a0562142a4a00b0066da309275dmr13264399qvb.1.1698197644877;
        Tue, 24 Oct 2023 18:34:04 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id pz6-20020ad45506000000b0065b24c08994sm4019073qvb.128.2023.10.24.18.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 18:34:04 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH][mickledore] arm/linux-yocto: remove defconfig patch
Date: Tue, 24 Oct 2023 21:33:54 -0400
Message-Id: <169819763432.2093250.8277922252985891397.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231020142911.2755434-1-ross.burton@arm.com>
References: <20231020142911.2755434-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Oct 2023 01:34:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5170


On Fri, 20 Oct 2023 15:29:11 +0100, ross.burton@arm.com wrote:
> Mikko Rapeli upstreamed the patch for the Nuvoton defconfig issue and it
> has been pulled back the 6.1 kernel.  So, it is no longer needed here.
> 
> 

Applied, thanks!

[1/1] arm/linux-yocto: remove defconfig patch
      commit: bbe2d63100a2554e7bf7f41d48e307f1bc386319

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

