Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FD5CEACE2
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 16:11:10 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.85672.1727799064102574214
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Oct 2024 09:11:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6DEE440C82;
	Tue,  1 Oct 2024 16:11:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MURbQJa5H0Ex; Tue,  1 Oct 2024 16:11:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 31B3940BA7;
	Tue,  1 Oct 2024 16:10:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E1A7D1640AC; Tue,  1 Oct 2024 12:10:58 -0400 (EDT)
Date: Tue, 1 Oct 2024 12:10:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Adrian DC <radian.dc@gmail.com>
Cc: Jon Mason <jdmason@kudzu.us>, Javier Tia <javier.tia@linaro.org>,
	meta-arm@lists.yoctoproject.org, Jon Mason <jon.mason@arm.com>
Subject: Re: [meta-arm] [PATCH] trusted-firmware-a: fix build error when
 using ccache
Message-ID: <20241001161058.GE14676@denix.org>
References: <20240928155436.1145975-1-radian.dc@gmail.com>
 <ZvqvFhYoRXQ9RQ4H@kudzu.us>
 <7afc0d4f-cf91-4750-93a3-3fc9c9a1b364@linaro.org>
 <CAPoiz9xr1DyEP-XWCRK_uhShDbb0kRrfcw8V8PL_CGwcCAP2PA@mail.gmail.com>
 <c5d876bf-2c3e-4fe2-8ebb-92dec0a0a3f5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c5d876bf-2c3e-4fe2-8ebb-92dec0a0a3f5@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Oct 2024 16:11:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6155

On Tue, Oct 01, 2024 at 03:56:42AM +0200, Adrian DC wrote:
> Hi,
>=20
> Sorry I wasn't available to respond earlier.
>=20
> Apparently the details I added after the initial send got lost.
>=20
> - Original commit : nanbield and scarthgap
> (f2efb2a45610216cb6c2d72bdb5d5e61b990064a as you pointed out)
> - Missing on : kirkstone and mickledore
> - Tested on : kirkstone with CCache enabled
>=20
> The cherry-pick was over kirkstone, without any changes except
> validation hence signoff (old Android System habits),
> proposal was to apply the fix on kirkstone (being LTS and used by
> most SOM providers for now).

To avoid such confusions, it is customary to specify [branch] name in=20
the Subject, when it is intended as a backport, for example:

Subject: [meta-arm][kirkstone][PATCH] trusted-firmware-a: fix build error=
 when using ccache

--=20
Denys


> On 01/10/2024 01:02, Jon Mason wrote:
> >On Mon, Sep 30, 2024 at 6:47=E2=80=AFPM Javier Tia<javier.tia@linaro.o=
rg>  wrote:
> >>Hi,
> >>
> >>On 9/30/24 8:00 AM, Jon Mason wrote:
> >>>On Sat, Sep 28, 2024 at 05:54:36PM +0200, Adrian DC wrote:
> >>>>From: Javier Tia<javier.tia@linaro.org>
> >>>>
> >>>>When ccache is enabled trusted-firmware-a recipe fails with this
> >>>>error message:
> >>>>
> >>>>      make: *** No rule to make target 'aarch64-poky-linux-gcc'. St=
op.
> >>>>
> >>>>ccache prefix CC variable with 'ccache' word before compiler. Becau=
se
> >>>>there are no quotes assigned to CC, only 'ccache' is assigned. The
> >>>>compiler becomes a make target, producing the build error.
> >>>>
> >>>>Add single quotes to LD is a good measure to prevent this kind of e=
rror.
> >>>>
> >>>>Signed-off-by: Javier Tia<javier.tia@linaro.org>
> >>>>Signed-off-by: Jon Mason<jon.mason@arm.com>
> >>>>Signed-off-by: Adrian DC<radian.dc@gmail.com>
> >>>I have questions about this patch's origins, given the above s-o-b's=
.
> >>>Signed-off-by's state an authorship or handling (see Developer=E2=80=
=99s
> >>>Certificate of Origin).  Since I have not seen this patch, I should
> >>>not be listed.  It's on me to add my s-o-b.  Also, the ordering tend=
s
> >>>to matter, as each person handling the patch adds their s-o-b at the
> >>>end of the patch.  So, you should be second, since you are taking th=
is
> >>>from Javier and submitting it for him (nd I would be last since
> >>>I'mtaking it from you).
> >>>
> >>>Also, this feels like it needs a "Fixes:" line.  So, I know how far =
to
> >>>pull this back in the stable branches.
> >>>
> >>>Finally, I find it weird that Javier isn't submitting this himself.
> >>>Javier appears to be the author, and it includes his Linaro emaila
> >>>ddress, and you are sending it from a gmail account.  Are you
> >>>co-authors?  Are you sending it with his approval because he is
> >>>busy/vacationing/ill?
> >>>
> >>>Overall the patch is fine and I would normally include it, but this =
is
> >>>weird to me.  If Javier acks it to confirm his authoer, then I'll mo=
ve
> >>>my s-o-b to the end and include it.
> >>Oh, this is a surprise.
> >>
> >>Jon has a good point.
> >>
> >>I have not approved sending this patch on my behalf. Yes, it looks li=
ke I am the original author because I recall fixing some issues around cc=
ache a time ago; maybe last year if I remember correctly. But, before I a=
cked it, I would like to know from where it was taken to have a bit more =
context. URL? Was the patch accepted or rejected?
> >I think I know what might've happened.  It's already in the tree
> >(commit f2efb2a45610216cb6c2d72bdb5d5e61b990064a).
> >I'm guessing that Adrian accidentally sent it to this list while
> >trying to backport it to an older release.  I got overly concerned
> >with the s-o-b lines and didn't think to check what it wasn't applying
> >:)
> >
> >Anyway, I think we can disregard this.
> >
> >Thanks,
> >Jon
> >
> >>   >
> >>>Jon
> >>>
> >>>
> >>>>---
> >>>>   .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | =
4 ++--
> >>>>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>
> >>>>diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmwa=
re-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> >>>>index 2e3b50c5..5d3da59b 100644
> >>>>--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.in=
c
> >>>>+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.in=
c
> >>>>@@ -101,9 +101,9 @@ def remove_options_tail (in_string):
> >>>>       from itertools import takewhile
> >>>>       return ' '.join(takewhile(lambda x: not x.startswith('-'), i=
n_string.split(' ')))
> >>>>
> >>>>-EXTRA_OEMAKE +=3D"LD=3D${@remove_options_tail(d.getVar('LD'))}"
> >>>>+EXTRA_OEMAKE +=3D"LD=3D'${@remove_options_tail(d.getVar('LD'))}'"
> >>>>
> >>>>-EXTRA_OEMAKE +=3D"CC=3D${@remove_options_tail(d.getVar('CC'))}"
> >>>>+EXTRA_OEMAKE +=3D"CC=3D'${@remove_options_tail(d.getVar('CC'))}'"
> >>>>
> >>>>   # Verbose builds, no -Werror
> >>>>   EXTRA_OEMAKE +=3D "V=3D1 E=3D0"
> >>>>--
> >>>>2.43.0
> >>>>
> >>>>
> >>Thanks,
> >>
> >>=C2=BB Javier Tia =F0=9F=96=8B

