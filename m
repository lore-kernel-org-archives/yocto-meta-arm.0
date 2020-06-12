Subject: Re: [PATCH] trusted-firmware-a: fiptool build using BUILD_CFLAGS and BUILD_LDFLAGS
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Fremont, California, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 12 Jun 2020 05:54:07 -0700
References: <20200612124503.GB14746@kudzu.us>
In-Reply-To: <20200612124503.GB14746@kudzu.us>
Message-ID: <14107.1591966447946904888@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2020 at 01:45 PM, Jon Mason wrote:

>
> On Thu, Jun 11, 2020 at 03:17:04PM +0100, Diego Sueiro wrote:
> > Since the TF-A fiptool is native tool we should be using the
> > BUILD_CFLAGS and BUILD_LDFLAGS flags to proper build and execute it.
> >=20
> > Change-Id: I9634604dbc42ba7da85d9b9449f1ed94ecb38df2
> > Issue-Id: SCM-888
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
>=20
> Pulled into master.

Thanks.

Could you please backport it to dunfell?
