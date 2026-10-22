Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3525.1792687713995161684
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 09:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=uyvc1uyI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93cb9e9405fso107408685a.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 22 Oct 2026 09:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1792687713; x=1793292513; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UGo0NxRaqTqz1w65shP0rHh565JDU7sUtJROccgYOxc=;
        b=uyvc1uyIbZN2DdPO3iMB4EOvps503C/95jvbQCaIhT21pMSS8CJdVbiUgNdwLaObWt
         zDF6LgYFqWuJKpY2WiVD4xwBPLA+Hc67JWJeGEUhD0upd2k4PmqkXtTIbkFf3H2jWL8M
         jZi1TFd1JFClvB82wT1Ik8MOYih3lko1XaLLAAzehGyIFMCyHaAsung1Jwau0BxBVQMY
         KWGcmT6zeksMep4rpJipJ94acpBouccnwS1wXMgTWFgbKmPsqf6sfRshbVbnuGCqVVU1
         /0ZIkGIfojaWdK2eoYOoPufE1jD3+kpG7fW/6wnzs0qa1Xag4BEbDBp5AnDWkDActfRC
         PEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687713; x=1793292513;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UGo0NxRaqTqz1w65shP0rHh565JDU7sUtJROccgYOxc=;
        b=daIBgAzwUxPWfEegKszN2c9G+zTjKBGcMRvKe2ESc7frK/kACOTT8kRyEDbKTQDl8M
         OJQs5t/zo7TpAAB4O/6Y16NIAHwMcqAjghXFmJQXt9JmhsJ1X/J4LeSeur3Aj6bUHnY6
         TmJWCo90b1eJfQec5eIa1ogAk8LfPvdbQ6UMhq9IsIQAqOFxPaqHFO+Oo0PielgNOFxA
         URtkVDH9REqd8LT62T0lFEDsipdWgDzGVdKMvAJRNfai84eGsI1Nh3gXpPDU0ZISNcrg
         kBUyzgYLfwf55zXc25FEvQ0OYtesPLRDGIhPU/LpxbDeaAd68o+oYZO32o8PMvRYe59b
         EkjQ==
X-Gm-Message-State: AFq9FYJHNlXIGr44K+DjPVH75IhjjeoFm1T26uhoJyxTN9X0pp9SejPg
	XR7rv3yVclFTnX+zOpTOsNgGQnwSJdo1WCowGXeSCgyAsb3Qjf/yRw7qoZX3JBqAnqR0aJOEJ7J
	PrTc=
X-Gm-Gg: AYBFou2zPce7PzvCCS6nbx8X4gEj/0QN+CeEOVXhGDTy8ToYqiTrc3S2X8ktrbukgxj
	gwryUHet2zuoG+juPV9Sg23Mc/HdbQYtUX5sxjEYKsev+BaGvwNkCSfq19u+hBY7oQyCZV0WcDU
	t63hIZR7I9z4WFxyTYAQnAK9QAEyQOHB7IM7+DbxMjJ4zchoWxKJldJaHufXGPO78LMwsXkUeuR
	xYQxjlura6wJnixMse7dgYU/nHWSp5lMZ0Ly0MkME0E7HX6zT0+Kz4foslxZ6dNr9GESc7nlKva
	EVZ4QkhqxiivDgSL+ft1VLff9gUkr59VBOjsPqoWB6xCUCQOqKK+0PPvPPRZJ5wMl/TG8qr3/hn
	v+V897WaI7FpHBk9ocrageMp5yjDvTXHonhdaLm9GvgdTHI4NWra5by4DD4blkcV+teX74svmSd
	HZqCUhpNUpTkDHdB8gT46bnovo42fUm/3DA25TxlMaaA90cs3W40/6asoWwM03BICceeSu5C7IS
	e8jXV8BjfUKco7BZWb6cLnYryD/0zl/xRcpPx1XYWKl5w==
X-Received: by 2002:a05:620a:628d:b0:93e:4f4c:b380 with SMTP id af79cd13be357-93f6f79e87fmr4733585a.10.1792687712478;
        Thu, 22 Oct 2026 09:48:32 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56d98fafsm562856885a.15.2026.10.22.09.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:48:32 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: Re: [PATCH] arm/linux-yocto: enable /dev/mem for Trusted Services tests
Date: Thu, 22 Oct 2026 12:48:23 -0400
Message-Id: <179268770330.1372893.13921721665389217541.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261022134036.2410154-1-anusmita.duttamazumder@arm.com>
References: <20261022134036.2410154-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Thu, 22 Oct 2026 16:48:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7195


On Thu, 22 Oct 2026 14:40:36 +0100, Anusmita Dutta Mazumder wrote:
> The Trusted Services uefi-test uses /dev/mem to map its
> MM communication buffer. The no-strict-devmem.cfg fragment
> relaxes the mapping restrictions, while CONFIG_DEVMEM
> controls whether /dev/mem is available.
> 
> Enable CONFIG_DEVMEM in the same fragment so the test can
> open /dev/mem and map the communication buffer.
> 
> [...]

Applied, thanks!

[1/1] arm/linux-yocto: enable /dev/mem for Trusted Services tests
      commit: a19f2dba816a211c699cb1318b7dbb818da4e32c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>
