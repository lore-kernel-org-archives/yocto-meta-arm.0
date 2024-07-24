Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A312C3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 01:11:26 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.847.1721783479471034942
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Jul 2024 18:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Mta8yBfq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6b79293a858so33843156d6.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 23 Jul 2024 18:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1721783478; x=1722388278; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X98DSLPWuRr/UpmeB7Jg8fxEvC3su3blj83yYVhLUMM=;
        b=Mta8yBfq/l4N2N25VdZHq2JdO/NEZ5JTKsdL/rdIqiaxOuUFCrOj47Sfqx7sOTk0n2
         ff7Jp0GakQhpL9OLvCyQtk/kq5RWZOyOsdv1BVNLx0V6RIhO5LDwAGCCA9/5uiZHCWaD
         Cb698S7D/tPaJdcuVlWDTdPMTQqQ0QtIn2yXBZcMEOE5GjaFmUOsZjKJ9RptOkfFsp8h
         TECeoRlrlXbQ7ALqxFdK38hpEHjPmsh+lm4aBoQbz/8LkwS8MZrpdnd1PdDUHNgGZJ+Y
         NLhgXsQdrJEhm55gKVjFV1JXnEdPR11XVwrUz47bXuksHdDjN9SvvEWPfYr1u6nvNXEU
         hgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721783478; x=1722388278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X98DSLPWuRr/UpmeB7Jg8fxEvC3su3blj83yYVhLUMM=;
        b=Gjt0V3bmjsWsBgfENRHPWsao1hGQzKryyOFoSePdSt1Z23IyIkXaI83DECz864jFsF
         B2d8MBtIKLUKZj8u5R4Fa+P4wIKD/vr9IzeVea8g0r9wNYWt+JwS8nHstIPPNpZwO04x
         v7uVfRYikPRUcUK+1Q46DgcYE2krletybSmG1ORpkWmrtR4bUZ9eq1+5s5TfmZiMRReP
         128/19+BrNKy0RWZP9ZL4QKkMUKnwXAg9CzDXJIC5JjsnkEPkcyPyVCzxZ9xjf1EXkUU
         veWE7FjPwxsVu7DBzAkRMPbszVsM5We9cKx7pqiUy3kCfs9fU3kJyogvnOu23KUwPwFC
         cnEA==
X-Gm-Message-State: AOJu0Yw9yA1pv7Sbc56F+kyuy3WrBxwfbzbmPdcZLP5fLLKvfRvFWbh0
	SvkeAKbu9RBWfrhbAN0azdoQOgCM448wyZkDXUaDzjuOwFEYExNQjxs3JOsfQ3UgHEYkjWzo9vM
	=
X-Google-Smtp-Source: AGHT+IFkslFQBrcIsOjfuhfl8Di5IiapAr2Qkdyhff67+Uysw6yONZTxgWsIH9cXlK1CoD5oEjN7mw==
X-Received: by 2002:ad4:5f45:0:b0:6b5:ead7:23cd with SMTP id 6a1803df08f44-6b990799013mr6832906d6.40.1721783478088;
        Tue, 23 Jul 2024 18:11:18 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b7b051c86csm50561066d6.116.2024.07.23.18.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 18:11:17 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	amr.mohamed@arm.com
Subject: Re: [PATCH scarthgap] kas: Update kas configuration for fvp-base.yml file
Date: Tue, 23 Jul 2024 21:11:13 -0400
Message-Id: <172178347302.3439346.12117164714748386448.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240719131434.2272392-1-amr.mohamed@arm.com>
References: <20240719131434.2272392-1-amr.mohamed@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 24 Jul 2024 01:11:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5914


On Fri, 19 Jul 2024 14:14:34 +0100, amr.mohamed@arm.com wrote:
> Change defaults repo refspec in fvp-base.yml file from master to
> scarthgap.
> 
> 

Applied, thanks!

[1/1] kas: Update kas configuration for fvp-base.yml file
      commit: 1b85bbb4cab9658da3cd926c62038b8559c5c64e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

