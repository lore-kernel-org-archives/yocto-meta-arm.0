Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02440C433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 20:56:28 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web09.13255.1642193786792476070
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Jan 2022 12:56:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=By3P3SmD;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id bb9so6525796qtb.5
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Jan 2022 12:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GlhYIvus4npPqmU4bXsmMfrQMNhn5qyR2hE90xRzPkg=;
        b=By3P3SmD9ZqaK/zvEJwvNX2PkbblXsJ/PAFatda2CpjYPlT7K4ICgHxF8/cbZAZIvz
         HF0k1s2NmOyFxvCsz3jo9e0B3d+Mc3gaXKqoHdeeP94z49BirwGRUefWPCZ+c3wkUznv
         MUz5UF0sbGhPslaNNIfPRL9H40KF1zDU+ldbXTLFCMhjAjdMOuR8HY1I3VbjuZD9Aba5
         Vku5gJOVoBNVFuda/Ib3EIjhyDAC6wKor9lRLwGWC+tWUHxEiHKXykWM1V6T8B7lOq6K
         gCg1O0DH+8hfgMulqSpMmjj7h6yndB6AdE8m7iorQo0WJK3KI3E5S/fyWcqIuIg8ZZF6
         qiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GlhYIvus4npPqmU4bXsmMfrQMNhn5qyR2hE90xRzPkg=;
        b=o6kQyFKPwOpEJEmmdRGdSXfumJuotmwkVHvmRfjVtBd2dX0jSDWEUQu/yMMaWV5y/4
         siso25FoWEYjB+9TxyW4gYRkfbpUARE/P91s5Xpl2D7VUu+XHBFFFingaOAdrYC8eaA3
         AUAcbQPZYRQ2XbJp/uK+9cwA54ZwQGWBM4YmkrG83xHAQ42xntjwegnvU0PK5Ko6g72x
         hJPNZlGH5/yyMpjjGTQ3UFY9cYe+shiex6A83QJ5F8dBnn0w4iZXmy+58gWMddsQs2aa
         cDVkJ2AKXuE+1h3dLUKxspVD7wkcsnWhpy5SF0fa7tv1pIUgi/UedVtAIqlKhAsXaNt5
         b8UQ==
X-Gm-Message-State: AOAM531tEHN9EbuK7q10gCsmR6QqeLPDU3p+kfVX7TAhMjDXUZWHxOtG
	Zmrx6xb1A8HmIXlDJ1XcNRIg3cp8Zq0xVA==
X-Google-Smtp-Source: 
 ABdhPJwYEMz84AYfB6jajjXVzFVxtiAGFa4nzDTwAHEnvVx9giH5YjfPwHub77f0ynUhyi6Ve+zO7w==
X-Received: by 2002:a05:622a:1c5:: with SMTP id
 t5mr9279817qtw.311.1642193785889;
        Fri, 14 Jan 2022 12:56:25 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:de4f:97a0:457b:40cf])
        by smtp.gmail.com with ESMTPSA id
 k8sm4520566qtx.35.2022.01.14.12.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 12:56:25 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/fvp-baser-aemv8r64: Update to the 5.15 kernel
Date: Fri, 14 Jan 2022 15:56:14 -0500
Message-Id: <164219377456.3112018.16320027057021521416.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220114140124.21091-1-jon.mason@arm.com>
References: <20220114140124.21091-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 14 Jan 2022 20:56:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2833

On Fri, 14 Jan 2022 09:01:24 -0500, Jon Mason wrote:
> The Linux 5.14 kernel has been removed.  Update to the latest kernel.

Applied, thanks!

[1/1] arm-bsp/fvp-baser-aemv8r64: Update to the 5.15 kernel
      commit: 30e50575f8d126ef89d9bec814d3ee0fcfd4ffb4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

