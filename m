Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A339C47422
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 03:05:10 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.8923.1706324707748879898
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Jan 2024 19:05:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=tJn83Gqa;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-42a7aa96669so8724231cf.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 26 Jan 2024 19:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1706324706; x=1706929506; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JAmZwE8iXWPc8nKbpttlBXjdpiI9tQrpdmbCbhmCipM=;
        b=tJn83Gqauq1kbxDYp9Mf22WaXGo6IPDAjAjlHnqB4bw58r7SsoDMCIWDbHIfXHdx8Z
         tUn0MHGuVZXPUWsOrUqan7FVFf4XzXtUkkgnas5hPY/1FRSbRdDwWVPsDu+qPZCM/8+d
         9BZqexTNXJ2uJxI6Okb0JRMw82bvtxYvpUMwiSbNIXk44i7H7ehyPAsvOaDpndvinGGf
         sl+zqn08OhRVEsIXA3Uru6QpvvsK75cYtSJO5+wpEiYQX/yjSjpoeWY7SgeovBw6GRsR
         YlgRkIGZUtAeqR2RCgnIwHpHwJaK9Pl3/RT71fcEwkSczqgJNCp6bDUaKVbUQrA3rAuZ
         nkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706324706; x=1706929506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAmZwE8iXWPc8nKbpttlBXjdpiI9tQrpdmbCbhmCipM=;
        b=Lrj2Z2TGzqxeChKarfpXxXmGjXyBp0O/aBpZf+iuk7UTGxx9o4kNXGB2Nwq30konXZ
         g6gPDIuLk01o/rheZWR4F6A8y4reh2IfalL/ZNw0OFJhD9uyf3M13wvS+yOlL1t4elTT
         h6WIbzJYXZDYANJktVrwsi7NpRSejTkdJH32eUHXSJNTytTOu3cGKHppN8PVKWnh75U7
         4YTaHJ4WgOu4aQY6ujb+MzId1yAUT2cB8kKSBL1EyjPIH6erfDcXBev+yphf+xqjJrn6
         K7wO/XLAfShksyVRDTtMA2uPTUpEcwtRd/On+uRSl10SLbswycyIMFyiC5Nfh6fqwYaV
         Ob8A==
X-Gm-Message-State: AOJu0YwoGwD41JSr2j5AW7KVsl+uft/Atb+7Bz0S/1VKKdqFB7Dw4PcG
	rq5U2upsM8qrPCPZDmdb245/CuplY3XFyOICttJLjSH//VAMpIek6jZR4V8SR0uJXWteGDbCvW4
	=
X-Google-Smtp-Source: AGHT+IHS77n7Sy4Zk2e4leUzx7vZZrrYxGWaEEWylZ9ITAXjodBBAJKx9byCQ+9zW9fty5zqQ1AwMQ==
X-Received: by 2002:ac8:5ad4:0:b0:42a:5150:3e46 with SMTP id d20-20020ac85ad4000000b0042a51503e46mr1072059qtd.47.1706324705986;
        Fri, 26 Jan 2024 19:05:05 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id ca21-20020a05622a1f1500b00429cfdac07fsm1110941qtb.18.2024.01.26.19.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 19:05:05 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm/opencsd: update to v1.5.1
Date: Fri, 26 Jan 2024 22:04:47 -0500
Message-Id: <170632468826.1980272.8212333920523499235.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240126151236.59981-1-jon.mason@arm.com>
References: <20240126151236.59981-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 27 Jan 2024 03:05:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5366


On Fri, 26 Jan 2024 10:12:34 -0500, Jon Mason wrote:
> 


Applied, thanks!

[1/3] arm/opencsd: update to v1.5.1
      commit: b422688735de8a1705323fa19a5fd08d1f6a28de
[2/3] arm/optee: update to 4.1
      commit: 5a78c75f3544afb670927cc004097db36a8ce162
[3/3] arm-bsp/optee: remove unused v3.22.0 recipes
      commit: d1f05978224605e592a0003a057e69efdd58a3da

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

